. $env:ScriptRoot\iperf\iperf-define.ps1

Write-Output "--- Server: $ServerName ---"
Write-Output ""
FindAllIP($ServerName)
Write-Output ""
Get-WmiObject Win32_Process -ComputerName $ServerName -Filter "name like '%$ProcessName%'" | select CommandLine
Write-Output ""
Write-Output "--- Client: $ClientName ---"
Write-Output ""
FindAllIP($ClientName)
Write-Output ""
Get-WmiObject Win32_Process -ComputerName $ClientName -Filter "name like '%$ProcessName%'" | select CommandLine