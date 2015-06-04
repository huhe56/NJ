. $env:ScriptRoot\iperf\multi-iperf-define.ps1

$i = 0
foreach ($server in $serverList) {
    $client = $clientList[$i++]
    PingHost2Host $server $client
}