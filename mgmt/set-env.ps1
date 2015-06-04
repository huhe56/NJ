
### NJ/administrator already in VM local administrators group in the VM template, not needed to set here.

$hostId = "171"
$vmIdList = (1..10)

$vmPrefix = "vm-$hostId"


function GetHostNameList($hostPrefix, $hostIdList) {
    $hostList = @()
    foreach ($hostId in $hostIdList) {
        $padHostId = "$hostId".PadLeft(2, '0')
        $hostName = "$hostPrefix-$padHostId"
        $hostList += $hostName
    }
    return $hostList
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

$vms = GetHostNameList $vmPrefix $vmIdList

$servers = $vms

foreach ($server in $servers) {
    Write-Output "--- $server ---"
    
    Write-Output "set env ..."
    SetEnvOnHost $server 'ScriptRoot' 'Z:\scripts' 'Machine'
    Write-Output "get env ..."
    GetEnvOnHost $server 'ScriptRoot' 'Machine'
    Write-Output ""
}