.  $env:ScriptRoot\define.ps1

$hostPrefix = "vm-151"
$vmsIdList = (1..20)
$vms = GetHostNameList $hostPrefix $vmsIdList

foreach ($vm in $vms) {
    Write-Output ""
    Write-Output "----------- $vm -----------"
    Write-Output ""
    
    $scriptPath = "$env:ScriptRoot\mgmt\script-in-vm.ps1"
    StartScriptOnHost $vm $scriptPath
}