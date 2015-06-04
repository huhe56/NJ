. $env:ScriptRoot\iperf\iperf-define.ps1

$serverList =  GetNewarkVMNameListFromHost "151"
$serverList += GetRutgersVMNameListFromHost "131"

echo ""
echo "iPerf Server List:"
echo $serverList
echo ""

$clientList =  GetNewarkVMNameListFromHost "171"
$clientList += GetRutgersVMNameListFromHost "141"

echo ""
echo "iPerf Client List:"
echo $clientList
echo ""