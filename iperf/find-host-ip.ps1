. $env:ScriptRoot\iperf\iperf-define.ps1

Write-Output "--- $ServerName ---"
Write-Output ""
FindAllIPnMAC $ServerName
Write-Output ""

Write-Output "--- $ClientName ---"
Write-Output ""
FindAllIPnMAC $ClientName
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