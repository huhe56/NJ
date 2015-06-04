. $env:ScriptRoot\define.ps1

$hostId = "151"
$vmIdList = (1..10)

$scvmHost = "host-$hostId"
$vmHostPrefix = "vm-$hostId"
$vmHostList = GetHostNameList $vmHostPrefix $vmIdList

$hostType = GetHostType($hostId)
$param = @{}
if ($hostType -eq $NEWARK) {
    ### Newark
    echo "Newark ..."
    $param["scvmTemplateName"] = "template-w2k12r2"
    $param["scHardwareProfileName"] = "hp-vm-w2k12r2-171-2"
    $param["scGuestOsProfileName"] = "Guest-Win-Profile"
}
else {
    ### Others
    echo "Rutgers or Princeton ..."
    $param["scvmTemplateName"] = "template-w2k12"
    $param["scHardwareProfileName"] = "hp-131-3"
    $param["scGuestOsProfileName"] = "GuestOSProfile-131"
}


function DeployVM($vmName, $scvmHost, $param) {
$jobGroup = [guid]::NewGuid().ToString()

$scvmTemplateName = $param["scvmTemplateName"]
$scHardwareProfileName = $param["scHardwareProfileName"]
$scGuestOsProfileName = $param["scGuestOsProfileName"]

$scRunAsAccount = "NJ Administrator"
$newScvmTemplateName = "Temporary Template$jobGroup"

$Template = Get-SCVMTemplate -VMMServer localhost -Name $scvmTemplateName
$HardwareProfile = Get-SCHardwareProfile -VMMServer localhost | where { $_.Name -eq $scHardwareProfileName }
$scGuestOsProfile = Get-SCGuestOSProfile -Name $scGuestOsProfileName
New-SCVMTemplate -Name $newScvmTemplateName -Template $Template -HardwareProfile $HardwareProfile -JobGroup $jobGroup -ComputerName $vmName -GuestOSProfile $scGuestOsProfile -AnswerFile $null 
$template = Get-SCVMTemplate -All | where { $_.Name -eq $newScvmTemplateName }

$virtualMachineConfiguration = New-SCVMConfiguration -VMTemplate $template -Name $vmName
Write-Output $virtualMachineConfiguration
$vmHost = Get-SCVMHost -ComputerName $scvmHost
Set-SCVMConfiguration -VMConfiguration $virtualMachineConfiguration -VMHost $vmHost
Update-SCVMConfiguration -VMConfiguration $virtualMachineConfiguration

$AllNICConfigurations = Get-SCVirtualNetworkAdapterConfiguration -VMConfiguration $virtualMachineConfiguration

Update-SCVMConfiguration -VMConfiguration $virtualMachineConfiguration

New-SCVirtualMachine -Name $vmName -VMConfiguration $virtualMachineConfiguration -Description "r2" -BlockDynamicOptimization $false -StartVM -JobGroup $jobGroup -ReturnImmediately -StartAction "AlwaysAutoTurnOnVM" -StopAction "SaveVM"
}


### main ###

foreach ($vmHost in $vmHostList) {
    Write-Output ""
    Write-Output "----------- deploying $vmHost on $scvmHost -----------"
    Write-Output ""
    DeployVM $vmHost $scvmHost $param
    Start-Sleep -s 10
}


