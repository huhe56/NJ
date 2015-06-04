. $env:ScriptRoot\define.ps1

$hostId = "122"
$vmHostIdList = (1..20)

$targetHostName = "host-$hostId"
$vmHostPrefix = "vm-$hostId"
$vmHostNameList = GetHostNameList $vmHostPrefix $vmHostIdList

foreach ($vmName in $vmHostNameList) {
    $vm = Get-SCVirtualMachine -Name $vmName
    $sourceStoragePath = $vm.Location
    $sourceHostName = $vm.VMHost.Name
    Write-Output ""
    Write-Output " -----------  [$vmName]  in  [$sourceHostName] - [$sourceStoragePath]  ----------"
    Write-Output ""
}
