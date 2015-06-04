. $env:ScriptRoot\iperf\multi-iperf-define.ps1

$i = 0
foreach ($server in $serverList) {
    $client = $clientList[$i++]
    Write-Output ""
    Write-Output "----------- server: $server -----------"
    Write-Output ""
    Get-WmiObject Win32_Process -ComputerName $server -Filter "name like '%$ProcessName%'" | select CommandLine
    Write-Output ""
    Write-Output "----------- client: $server : $client -----------"
    Write-Output ""
    Get-WmiObject Win32_Process -ComputerName $client -Filter "name like '%$ProcessName%'" | select CommandLine
}
