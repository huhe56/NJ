.  $env:ScriptRoot\medusa\medusa-define.ps1

foreach ($vm in $vms) {
    Write-Output ""
    Write-Output "----------- $vm : $ProcessName -----------"
    Write-Output ""
    StopScriptOnHost $vm $scriptKeyword
    StopProcessOnHost $vm $ProcessName
}



