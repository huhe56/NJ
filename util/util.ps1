
function WaitForHostUp($hostName, $timeInSecond) {
    $interval = 10 
    $cnt = $timeInSecond/$interval
    for ($i = 0; $i -lt $cnt; $i++) {
        $isConnected = Test-NetConnection -ComputerName $hostName -InformationLevel Quiet -ErrorAction Continue -WarningAction Continue
        if ($isConnected) {
            return $true
        }
        else {
            Start-Sleep $interval
        }
    }
    return $false
}

function SetRegistry($path, $name, $value) {
    Set-ItemProperty -Path $path -Name $name -Value $value
}

function GetAllVMNameList() {
    $vmNameList =  GetAllNewarkVMNameList 
    $vmNameList += GetAllRutgersVMNameList
    return $vmNameList
}

function GetAllNewarkVMNameList() {
    $vmNameList = @()
    foreach ($hostId in $NewarkHostIdList) {
        $vmNameList += GetVMNameListFromHost $hostId $NewarkVMCount 
    }
    return $vmNameList
}

function GetAllRutgersVMNameList() {
    $vmNameList = @()
    foreach ($hostId in $RutgersHostIdList) {
        $vmNameList += GetVMNameListFromHost $hostId $RutgersVMCount 
    }
    return $vmNameList
}

function GetNewarkVMNameListFromHost($hostId) {
    $vmNameList = GetVMNameListFromHost $hostId $NewarkVMCount 
    return $vmNameList
}

function GetRutgersVMNameListFromHost($hostId) {
    $vmNameList += GetVMNameListFromHost $hostId $RutgersVMCount 
    return $vmNameList
}


function GetVMNameListFromHost($hostId, $vmCnt) {
    $vmNameList = @()
    $vmIdList = 1 .. $vmCnt
    foreach ($vmId in $vmIdList) {
        $vmId = "$vmId".PadLeft(2, '0')
        $vmNameList += "vm-$hostId-$vmId"
    }
    return $vmNameList
}

function GetHostNameList($hostPrefix, $hostIdList) {
    $hostList = @()
    foreach ($hostId in $hostIdList) {
        $padHostId = "$hostId".PadLeft(2, '0')
        $hostName = "$hostPrefix-$padHostId"
        #echo $hostName
        $hostList += $hostName
    }
    #echo $hostList
    return $hostList
}

function GetEnvOnHost($hostName, $envName=$null, $envType='Machine') {
    Invoke-Command -ComputerName $hostName -ScriptBlock { 
        param ($envName, $envType) 
        $envs = $null
        if (! $envName) {
            $envs = [Environment]::GetEnvironmentVariables()
        }
        else {
            $envs = [Environment]::GetEnvironmentVariable($envName, $envType)
        }
        Write-Output $envs
    } -ArgumentList $envName, $envType
}

function SetEnvOnHost($hostName, $envName=$null, $envValue, $envType='Machine') {
    Invoke-Command -ComputerName $hostName -ScriptBlock { 
        param ($envName, $envValue, $envType) 
        if ($envName) {
            [Environment]::SetEnvironmentVariable($envName, $envValue, $envType)
        }
        else {
            Write-Output "Environment name is empty"
        }
    } -ArgumentList $envName, $envValue, $envType
}

function StopProcessOnHost($hostName, $processName) {
    Write-Output "stopping process $processName on $hostName ..."
    Invoke-Command -ComputerName $hostName -ScriptBlock { param ($processName) Stop-Process -Name $processName } -ArgumentList $processName
}

function StartCmdletOnHost($hostName, $cmdlet, $param) {
    Write-Output ""
    #Write-Output "invoking cmdlet $cmdlet on $hostName ..."
    Invoke-Command -ComputerName $hostName -ScriptBlock { 
        param ($cmdlet, $param)  
        $paramStr = ""
        foreach ($key in $param.Keys) {
            $value = $param[$key]
            if ($value) {
                $paramStr += " -$key $value"
            }
            else {
                $paramStr += " -$key"
            }
        }
        $cmd = "$cmdlet$paramStr"
        Write-Output $cmd
        $result = iex $cmd 
        return $result
    } -ArgumentList $cmdlet, $param
}

function FindProcessOnHost($hostName, $ProcessName) {
    Get-WmiObject Win32_Process -ComputerName $hostName -Filter "name like '%$ProcessName%'" | select CSName, CommandLine
}

function StartScriptOnHost($hostName, $scriptPath) {
    Write-Output "starting script $scriptPath on $hostName ..."
    $session = MapDriveZ($hostName)
    Invoke-Command -Session $session -ScriptBlock {
        param($scriptPath)
        Set-ExecutionPolicy Bypass
        start-process powershell -argument $scriptPath
    } -ArgumentList $scriptPath
}

function StopScriptOnHost($hostName, $scriptKeyword) {
    $processInfoes = Get-WmiObject Win32_Process -ComputerName $vm -Filter "name like '%PowerShell%'" | select CommandLine, ProcessId
    foreach ($processInfo in $processInfoes) {
        $cmdLine = $processInfo.CommandLine
        $procId = $processInfo.ProcessId
        if ($cmdLine.ToLower().Contains($scriptKeyword.ToLower())) {
            Write-Output "Stopping $cmdLine ..."
            Invoke-Command -ComputerName $vm -ScriptBlock {
                param ($procId)
                Stop-Process -Id $procId
            } -ArgumentList $procId
        }
    }
}


function MapDriveZ($hostName) {
    $session = New-PSSession -ComputerName $hostName
    Invoke-Command -Session $session -ScriptBlock {
        (New-Object -ComObject WScript.Network).MapNetworkDrive(
            "Z:", "\\20.200.20.251\test", $true, "nj\administrator", "Cisco!32"
        )
    } 
    return $session
}

function FindAllIP($hostName) {
    $ips = @()
    $interfaces = Get-WmiObject Win32_NetworkAdapterConfiguration -ComputerName $hostName | where{$_.IPEnabled -eq "True"}
    foreach ($interface in $interfaces) {
        $ip = $interface.IPAddress[0]
        #Write-Output $ip
        $ips += $ip
    }
    return $ips
}

function FindAllIPnMAC($hostName) {
    $colItems = Get-WmiObject -Class "Win32_NetworkAdapterConfiguration" -ComputerName $hostName -Filter "IpEnabled = TRUE"
    ForEach ($objItem in $colItems) {
        write-host $objItem.Description
        write-host "MAC Address: " $objItem.MacAddress
        write-host "IP Address:  " $objItem.IpAddress[0]
        write-host ""
    }
}

Function IIF($If, $Right, $Wrong) {
    If ($If) {
        return $Right
    } 
    Else {
        return $Wrong
    }
}

function Get-NetwotkAddress {
    param (
        [IpAddress]$ip,
        [IpAddress]$Mask
    )
    $IpAddressBytes = $ip.GetAddressBytes()
    $SubnetMaskBytes = $Mask.GetAddressBytes()
 
    if ($IpAddressBytes.Length -ne $SubnetMaskBytes.Length) {
        throw "Lengths of IP address and subnet mask do not match."
        exit 0
    }
 
    $BroadcastAddress = @()
 
    for ($i=0;$i -le 3;$i++) {
        $BroadcastAddress += $ipAddressBytes[$i]-band $subnetMaskBytes[$i]
    }
 
    $BroadcastAddressString = $BroadcastAddress -Join "."
    return [IpAddress]$BroadcastAddressString
}
 
function Test-IsInSameSubnet {
    param (
        [IpAddress]$ip1,
        [IpAddress]$ip2,
        [IpAddress]$mask
    )
    $Network1 = Get-NetwotkAddress -ip $ip1 -mask $mask
    $Network2 = Get-NetwotkAddress -ip $ip2 -mask $mask
 
    return $Network1.Equals($Network2)
}


function PrintLineDash($msg) {
    Write-Output ""
    Write-Output "---------- $msg ----------"
    Write-Output ""
}

function PrintLineEquate($msg) {
    Write-Output ""
    Write-Output "========== $msg =========="
    Write-Output ""
}


function PrintResults($title, $ResultMap) {
    PrintLineEquate($title)
    foreach ($k in $resultMap.Keys) {
        $v = $resultMap[$k]
        $result = IIF $v "PASSED" "FAILED"
        Write-Output "$k : $result"
    }
}