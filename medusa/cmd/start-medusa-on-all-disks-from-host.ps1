.  $env:ScriptRoot\medusa\medusa-define.ps1

$diskIDs = @(0, 1, 2, 3)

foreach ($diskID in $diskIDs) {
    $job = "$MedusaScriptRootDir\disk$diskID\medusa-$diskID.ps1"
    Start-Job -FilePath $job
}