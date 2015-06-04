. $env:ScriptRoot\ntttcp\ntttcp-define.ps1

$ServerHostPrefix = "vm-141"
$serverIdList = (1..4)
$serverList = GetHostNameList $ServerHostPrefix $serverIdList

$clientHostPrefix = "vm-131"
$clientIdList = (1..4)
$clientList = GetHostNameList $clientHostPrefix $clientIdList