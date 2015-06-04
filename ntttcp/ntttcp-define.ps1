. $env:ScriptRoot\define.ps1

$LogDirRoot = "Z:\log\ntttcp"
$CmdIperf = "Z:\bin\NTttcp-v5.28\x64\NTttcp.exe"

$IperfServerArgs = "-r -v -a 6 -m ""1,*,"
$IperfClientArgs = "-s -v -a 2 -t 3600 -m ""1,*,"


$ServerName  = "vm-171-01"
$ClientName  = "vm-171-11"
$ProcessName = "NTttcp.exe"
$IperfPairCnt = 2


function PingHost2Host($ServerName, $ClientName) {
    Write-Output ""
    Write-Output "--- $ServerName ---"
    $svrIPs = FindAllIP $ServerName
    Write-Output $svrIPs | Sort-Object
    Write-Output ""

    Write-Output "--- $ClientName ---"
    $cltIPs = FindAllIP $ClientName 
    Write-Output $cltIPs | Sort-Object
    Write-Output ""

    foreach ($cltIP in $cltIPs) {
        if (! $cltIP.StartsWith("169.254")) {
            foreach ($svrIP in $svrIPs) {
                $isSameSubnet = Test-IsInSameSubnet $cltIP $svrIP 255.255.255.0
                if ($isSameSubnet) {
                    # ping server from client
                    Write-Output ""
                    Write-Output "--- ping $svrIP from $cltIP on $ClientName ---"
                    invoke-command -ComputerName $ClientName -ScriptBlock { param ($ips, $ipc) ping.exe $ips -S $ipc} -ArgumentList $svrIP, $cltIP
                    #$isPinged = Invoke-Command -ComputerName $ClientName -ScriptBlock { param ($ips, $ipc) Test-Connection $ips -Source $ipc} -ArgumentList $svrIP, $cltIP
                    #Write-Output ""
                    #Write-Output "=== status: $isPinged ==="
                    break
                }
            }
        }
    }
}

function StartServerOnHost($serverName) {
    $interfaces = Get-WmiObject Win32_NetworkAdapterConfiguration -ComputerName $serverName | where{$_.IPEnabled -eq “True”}
    foreach ($interface in $interfaces) {
        $ip = $interface.IPAddress[0]
        if (! $ip.StartsWith("169.254")) {
        #if ($ip.StartsWith("10.10.101")) {
            StartServerOnIP $serverName $ip
        }
    }
}

function StartServerOnIP($serverName, $ip) {
    $logDir = "$LogDirRoot\$serverName\server"
    New-Item -Force -ItemType directory -Path $logDir

    $logFileStdOut = "$logDir\$ip-stdout.txt"
    $logFileStdErr = "$logDir\$ip-stderr.txt"
    Remove-Item "$logFileStdOut" -Force -ErrorAction SilentlyContinue
    Remove-Item "$logFileStdErr" -Force -ErrorAction SilentlyContinue
    $args = "$IperfServerArgs$ip"""
    StartProcessOnHost $serverName $CmdIperf $args $logFileStdOut $logFileStdErr
}

function StartClientOnHost($serverName, $clientName) {
    $interfaces = Get-WmiObject Win32_NetworkAdapterConfiguration -ComputerName $serverName | where{$_.IPEnabled -eq “True”}
    foreach ($interface in $interfaces) {
        $ip = $interface.IPAddress[0]
        if (! $ip.StartsWith("169.254")) {
        #if ($ip.StartsWith("10.10.101")) {
            StartClientToIP $serverName $ip $clientName
        }
    }
}

function StartClientToIP($serverName, $serverIP, $clientName) {
    $logDir = "$LogDirRoot\$serverName\client-$clientName"
    New-Item -Force -ItemType directory -Path $logDir
    $logFileStdOut = "$logDir\$ip-stdout.txt"
    $logFileStdErr = "$logDir\$ip-stderr.txt"
    Remove-Item "$logFileStdOut" -Force -ErrorAction SilentlyContinue
    Remove-Item "$logFileStdErr" -Force -ErrorAction SilentlyContinue
    $argStr = "$IperfClientArgs$serverIP"""
    StartProcessOnHost $clientName $CmdIperf $argStr $logFileStdOut $logFileStdErr
}

function StartProcessOnHost($hostName, $cmdIperf, $argStr, $stdout, $stderr) {
    Write-Output "starting process $processName on $hostName ..."
    $session = MapDriveZ($hostName)
    Invoke-Command -Session $session -ScriptBlock { 
        param ($cmdIperf, $argStr, $stdout, $stderr) 
        Write-Output "$cmdIperf $argStr $stdout $stderr"
        Start-Process -NoNewWindow $cmdIperf -PassThru -ArgumentList "$argStr" -RedirectStandardOutput $stdout -RedirectStandardError $stderr 
    } -ArgumentList $cmdIperf, $argStr, $stdout, $stderr
}

function FindProcessOnHost($hostName, $processName) {
    Write-Output "checking process $processName on $hostName ..."
    Get-WmiObject Win32_Process -ComputerName $ClientName -Filter "name like '%$process%'" | select CommandLine
}

function StopProcessOnHost($hostName, $processName) {
    Write-Output "stopping process $processName on $hostName ..."
    Invoke-Command -ComputerName $hostName -ScriptBlock { param ($processName) Stop-Process -Name $processName } -ArgumentList $processName
}

