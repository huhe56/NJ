.  $env:ScriptRoot\medusa\medusa-define.ps1

$hostName = Get-WMIObject Win32_ComputerSystem | Select-Object -ExpandProperty name
$diskID   = 2

. $MedusaScriptRootDir\host\$hostName.ps1

RunMedusa $hostName $diskID $diskCfgs