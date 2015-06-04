. $env:ScriptRoot\medusa\medusa-define.ps1

foreach ($vm in $vms) {
    Write-Output ""
    Write-Output "----------- $vm -----------"
    Write-Output ""
    
    $scriptPath = "$MedusaScriptRootDir\vm\medusa-vm.ps1"
    StartScriptOnHost $vm $scriptPath
}
