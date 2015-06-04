. Z:\scripts\iperf\iperf-define.ps1

Write-Output "--- $ClientName ---"
Write-Output ""
StopProcessOnHost $ClientName $ProcessName
FindProcessOnHost $ServerName $ProcessName
Write-Output ""

Write-Output ""
Write-Output "--- $ServerName ---"
Write-Output ""
StopProcessOnHost $ServerName $ProcessName
FindProcessOnHost $ServerName $ProcessName
Write-Output ""