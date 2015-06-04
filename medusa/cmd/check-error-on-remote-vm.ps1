.  $env:ScriptRoot\medusa\medusa-define.ps1

Invoke-Command -ComputerName $vms -FilePath $MedusaScriptRootDir\cmd\find-vm-error.ps1

