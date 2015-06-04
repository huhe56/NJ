$ScriptRoot = $ENV:ScriptRoot

$NEWARK = "Newark"
$RUTGERS = "Rutgers"

$NewarkHostIdList = @("171", "151")
$NewarkVMCount = 10

$RutgersHostIdList = @("141", "131", "122")
$RutgersVMCount = 4

. $ScriptRoot/util/util.ps1

function GetHostType($hostId) {
    if ($NewarkHostIdList -contains $hostId) {
        return $NEWARK
    }
    else {
        return $RUTGERS
    }
}