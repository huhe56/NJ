Import-Module virtualmachinemanager

. $env:ScriptRoot\define.ps1

$hostIdList = @("122", "131", "141", "151", "171")

$g1 = [Math]::pow(1024, 3)
foreach ($hostId in $hostIdList) {
    $hostName = "host-$hostId"
    Write-Output ""
    Write-Output " ----------- host: $hostName ----------"
    Write-Output ""
    $diskList = Get-VMHostDisk -VMHost $hostName
    foreach ($disk in $diskList) {
        $volumes = $disk.DiskVolumes
        if ($volumes -ne "" -and $disk.PartitionStyle -ne "MasterBootRecord") {
            $freeSpace = [Math]::round($disk.AvailableCapacity/$g1)
            $capacity = [Math]::round($disk.Capacity/$g1)
            $percentage = [Math]::round(100*$freeSpace/$capacity)
            Write-Output " [$volumes] : free: $freeSpace / total: $capacity = $percentage%"
            Write-Output ""
        }
    }
}
