. $env:ScriptRoot\define.ps1


function MigrateStorage($vmName, $targetHostName, $targetStoragePath) {
    $vm = Get-SCVirtualMachine -Name $vmName
    $sourceStoragePath = $vm.Location
    $sourceHostName = $vm.VMHost.Name
    Write-Output ""
    Write-Output " -----------  migrating  [$vmName]  from  [\\$sourceHostName\$sourceStoragePath]  to  [\\$targetHostName\$targetStoragePath]  ----------"
    Write-Output ""
    if ($sourceStoragePath.Replace($vmName, "") -eq $targetStoragePath -and $sourceHostName.StartsWith($targetHostName)) {
        Write-Output "Warning: source and target hosts and pathes are the same, do nothing"
    }
    else {
        $targetHost = Get-SCVMHost | where { $_.Name -eq $targetHostName }
        Move-SCVirtualMachine -VM $vm -VMHost $targetHostName -Path $targetStoragePath -UseLAN -RunAsynchronously -UseDiffDiskOptimization
    }
}

$hostId = "151"
$targetStoragePath = "H:\"
$vmHostIdList = (7..9)

$targetHostName = "host-$hostId"
$vmHostPrefix = "vm-$hostId"
$vmHostNameList = GetHostNameList $vmHostPrefix $vmHostIdList

foreach ($vmName in $vmHostNameList) {
    
    MigrateStorage $vmName $targetHostName $targetStoragePath

}
