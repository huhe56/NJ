. $env:ScriptRoot\ntttcp\multi-ntttcp-define.ps1

$i = 0
foreach ($server in $serverList) {
    $client = $clientList[$i++]
    
    Write-Output ""
    Write-Output "----------- server: $server -----------"
    Write-Output ""
    StartServerOnHost $server

    Write-Output ""
    Write-Output "----------- client: $server : $client -----------"
    Write-Output ""
    StartClientOnHost $server $client
}