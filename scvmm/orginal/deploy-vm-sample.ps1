$macPool = Get-SCMACAddressPool -Name "Default MAC address pool"
$macs = Get-SCMACAddress -MACAddressPool $macPool -UnAssigned

echo $macs.Length

#Deploy VM from Template using incremental computer name
    $JobGroup = [guid]::NewGuid().ToString()
    $AnswerFiletoUse = Get-SCScript | where {$_.IsXMLAnswerFile -eq $True} | where {$_.Name -eq $AnswerFile}
    $OperatingSystemVersion = Get-SCOperatingSystem | where { $_.Name -eq $OperatingSystem}
    $HardwareProfile = Get-SCHardwareProfile | where {$_.Name -eq $HWProfileName}
    $Template = Get-SCVMTemplate | where {$_.Name -eq $VMTemplateName}
    $Null=New-SCVMTemplate -Name "Temporary Template$JobGroup" -Template $Template -HardwareProfile $HardwareProfile -JobGroup $JobGroup -ComputerName $VMName -TimeZone 85 -LocalAdministratorCredential $LocalAdministratorCredential  -AnswerFile $AnswerFiletoUse -MergeAnswerFile $false -OperatingSystem $OperatingSystemVersion
    $template = Get-SCVMTemplate -All | where { $_.Name -eq "Temporary Template$JobGroup" }
    $virtualMachineConfiguration = New-SCVMConfiguration -VMTemplate $template
    $Deploycloud = Get-SCCloud -Name $Cloud
    $NewVM=New-SCVirtualMachine -Name $virtualMachineConfiguration.Name -VMConfiguration $virtualMachineConfiguration -Cloud $Deploycloud -Description "" -JobGroup $JobGroup -ReturnImmediately -StartAction $StartAction -StopAction $StopAction
    Return $NewVM



#Setup Variables
$JobGroup = [guid]::NewGuid().ToString()
$VMNetwork = Get-SCVMNetwork -Name "Main Datacenter"
$PortClassification = Get-SCPortClassification | where {$_.Name -eq "High bandwidth"}
$CPUType = Get-SCCPUType | where {$_.Name -eq "3.60 GHz Xeon (2 MB L2 cache)"}
$CapabilityProfile = Get-SCCapabilityProfile | where {$_.Name -eq "Hyper-V"}
$OperatingSystem = Get-SCOperatingSystem | where { $_.Name -eq "Windows Server 2012 R2 Standard"}
$runAsAccount = Get-SCRunAsAccount | Where {$_.Name -eq "System Center Admin Account"}
$LocalAdministratorCredential = get-scrunasaccount -Name "Windows Server Local Admin Account"
$DomainJoinCredential = get-scrunasaccount -Name "System Center Admin Account"
$OSVirtualHardDisk = Get-SCVirtualHardDisk | where {$_.Name -eq "Server2012R2Std.vhdx"}
$AnswerFile = Get-SCScript | where {$_.IsXMLAnswerFile -eq $True} | where {$_.Name -eq "PowerONUnattend.xml"}
$Cloud="PowerONPlatforms CMA"
$PKServer2012R2StandardAVMA="DBGBW-NPF86-BJVTX-K3WKJ-MTB6V"
$Domain="PowerON.local"
$OUTarget="OU=Servers,DC=PowerON,DC=local"
$VMName="Example##"
$HWProfileName="VM Template Hardware Profile"
$VMTemplateName="Example VM Template"

#Create Hardware Profile
$Null=New-SCVirtualScsiAdapter -JobGroup $JobGroup -AdapterID 7 -ShareVirtualScsiAdapter $false -ScsiControllerType DefaultTypeNoType 
$Null=New-SCVirtualNetworkAdapter -JobGroup $JobGroup -MACAddress "00:00:00:00:00:00" -MACAddressType Static -Synthetic -IPv4AddressType Static -IPv6AddressType Dynamic -VMNetwork $VMNetwork -PortClassification $PortClassification
$Null=Set-SCVirtualCOMPort -NoAttach -GuestPort 1 -JobGroup $JobGroup
$Null=Set-SCVirtualCOMPort -NoAttach -GuestPort 2 -JobGroup $JobGroup
$Null=Set-SCVirtualFloppyDrive -RunAsynchronously -NoMedia -JobGroup $JobGroup 
$Null=New-SCHardwareProfile -CPUType $CPUType -Name $HWProfileName -Description "Hardware profile used to create a VM Template" -CPUCount 2 -MemoryMB 1024 -VirtualVideoAdapterEnabled $false -CPUExpectedUtilizationPercent 30 -DiskIops 0 -CPUMaximumPercent 100 -CPUReserve 0 -NumaIsolationRequired $false -NetworkUtilizationMbps 0 -CPURelativeWeight 100 -HighlyAvailable $true -HAVMPriority 2000 -DRProtectionRequired $false -NumLock $true -BootOrder "IdeHardDrive", "CD", "PxeBoot", "Floppy" -CPULimitFunctionality $false -CPULimitForMigration $false -CapabilityProfile $CapabilityProfile -JobGroup $JobGroup
#Add Boot VHDX
$Null=New-SCVirtualDiskDrive -IDE -Bus 0 -LUN 0 -JobGroup $JobGroup -VirtualHardDisk $OSVirtualHardDisk -VolumeType BootAndSystem 
$HardwareProfile = Get-SCHardwareProfile | where {$_.Name -eq $HWProfileName}
#Create VM Template
New-SCVMTemplate -Name $VMTemplateName -RunAsynchronously -Generation 1 -HardwareProfile $HardwareProfile -JobGroup $JobGroup -ComputerName $VMName -TimeZone 85 -LocalAdministratorCredential $LocalAdministratorCredential  -ProductKey $PKServer2012R2StandardAVMA -AnswerFile $AnswerFile -MergeAnswerFile $false -OperatingSystem $OperatingSystem -Domain $Domain -DomainJoinCredential $DomainJoinCredential -ApplicationProfile $null -SQLProfile $null -DomainJoinOrganizationalUnit $OUTarget


#Deploy VM from Template using incremental computer name
$JobGroup = [guid]::NewGuid().ToString()
$HardwareProfile = Get-SCHardwareProfile | where {$_.Name -eq $HWProfileName}
$Template = Get-SCVMTemplate | where {$_.Name -eq $VMTemplateName}
$Null=New-SCVMTemplate -Name "Temporary Template$JobGroup" -Template $Template -HardwareProfile $HardwareProfile -JobGroup $JobGroup -ComputerName $VMName -TimeZone 85 -LocalAdministratorCredential $LocalAdministratorCredential  -AnswerFile $AnswerFile -MergeAnswerFile $false -OperatingSystem $OperatingSystem 
$template = Get-SCVMTemplate -All | where { $_.Name -eq "Temporary Template$JobGroup" }
$virtualMachineConfiguration = New-SCVMConfiguration -VMTemplate $template
$Deploycloud = Get-SCCloud -Name $Cloud
New-SCVirtualMachine -Name $virtualMachineConfiguration.Name -VMConfiguration $virtualMachineConfiguration -Cloud $Deploycloud -Description "" -JobGroup $JobGroup -ReturnImmediately -StartAction "NeverAutoTurnOnVM" -StopAction "SaveVM"