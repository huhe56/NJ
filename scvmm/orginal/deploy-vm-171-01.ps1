# ------------------------------------------------------------------------------
# Create Virtual Machine Wizard Script
# ------------------------------------------------------------------------------
# Script generated on Thursday, May 7, 2015 11:46:06 AM by Virtual Machine Manager
# 
# For additional help on cmdlet usage, type get-help <cmdlet name>
# ------------------------------------------------------------------------------


New-SCVirtualScsiAdapter -VMMServer localhost -JobGroup 41cc0bc1-1b2b-42b5-b63e-9a3048b991cc -AdapterID 7 -ShareVirtualScsiAdapter $false -ScsiControllerType DefaultTypeNoType 


New-SCVirtualDVDDrive -VMMServer localhost -JobGroup 41cc0bc1-1b2b-42b5-b63e-9a3048b991cc -Bus 0 -LUN 1 

$VMSubnet = Get-SCVMSubnet -VMMServer localhost -Name "vm pxe linux_0" | where {$_.VMNetwork.ID -eq "244e97e2-f8a1-4b07-9a26-99b5c8fed435"}
$VMNetwork = Get-SCVMNetwork -VMMServer localhost -Name "vm pxe linux" -ID "244e97e2-f8a1-4b07-9a26-99b5c8fed435"
$PortClassification = Get-SCPortClassification -VMMServer localhost | where {$_.Name -eq "VM pxe linux"}

New-SCVirtualNetworkAdapter -VMMServer localhost -JobGroup 41cc0bc1-1b2b-42b5-b63e-9a3048b991cc -MACAddress "00:1D:D8:B7:1C:0F" -MACAddressType Static -VirtualNetwork "vm switch" -VLanEnabled $true -VLanID 10 -Synthetic -IPv4AddressType Static -IPv6AddressType Dynamic -VMSubnet $VMSubnet -VMNetwork $VMNetwork -PortClassification $PortClassification 

$VMSubnet = Get-SCVMSubnet -VMMServer localhost -Name "vm mgmt_0" | where {$_.VMNetwork.ID -eq "9b126f4a-707d-4558-af5d-bcbba869bb5c"}
$VMNetwork = Get-SCVMNetwork -VMMServer localhost -Name "vm mgmt" -ID "9b126f4a-707d-4558-af5d-bcbba869bb5c"
$PortClassification = Get-SCPortClassification -VMMServer localhost | where {$_.Name -eq "VM management"}

New-SCVirtualNetworkAdapter -VMMServer localhost -JobGroup 41cc0bc1-1b2b-42b5-b63e-9a3048b991cc -MACAddress "00:1D:D8:B7:1C:11" -MACAddressType Static -VirtualNetwork "vm switch" -VLanEnabled $true -VLanID 20 -Synthetic -IPv4AddressType Static -IPv6AddressType Dynamic -VMSubnet $VMSubnet -VMNetwork $VMNetwork -PortClassification $PortClassification 

$VMSubnet = Get-SCVMSubnet -VMMServer localhost -Name "vm medusa_0" | where {$_.VMNetwork.ID -eq "822c63f6-7f11-43b8-8daa-f0a9a6933855"}
$VMNetwork = Get-SCVMNetwork -VMMServer localhost -Name "vm medusa" -ID "822c63f6-7f11-43b8-8daa-f0a9a6933855"
$PortClassification = Get-SCPortClassification -VMMServer localhost | where {$_.Name -eq "VM medusa"}

New-SCVirtualNetworkAdapter -VMMServer localhost -JobGroup 41cc0bc1-1b2b-42b5-b63e-9a3048b991cc -MACAddress "00:1D:D8:B7:1C:12" -MACAddressType Static -VirtualNetwork "vm switch" -VLanEnabled $true -VLanID 2000 -Synthetic -IPv4AddressType Static -IPv6AddressType Dynamic -VMSubnet $VMSubnet -VMNetwork $VMNetwork -PortClassification $PortClassification 

$VMSubnet = Get-SCVMSubnet -VMMServer localhost -Name "vm 101_0" | where {$_.VMNetwork.ID -eq "f5a90f48-314b-4837-9e3b-645c05b95c19"}
$VMNetwork = Get-SCVMNetwork -VMMServer localhost -Name "vm 101" -ID "f5a90f48-314b-4837-9e3b-645c05b95c19"
$PortClassification = Get-SCPortClassification -VMMServer localhost | where {$_.Name -eq "VM 101"}

New-SCVirtualNetworkAdapter -VMMServer localhost -JobGroup 41cc0bc1-1b2b-42b5-b63e-9a3048b991cc -MACAddress "00:1D:D8:B7:1C:0E" -MACAddressType Static -VirtualNetwork "vm switch" -VLanEnabled $true -VLanID 101 -Synthetic -IPv4AddressType Static -IPv6AddressType Dynamic -VMSubnet $VMSubnet -VMNetwork $VMNetwork -PortClassification $PortClassification 

$VMSubnet = Get-SCVMSubnet -VMMServer localhost -Name "vm 102_0" | where {$_.VMNetwork.ID -eq "f1fb8b12-9c31-402a-9692-2c04802ebe18"}
$VMNetwork = Get-SCVMNetwork -VMMServer localhost -Name "vm 102" -ID "f1fb8b12-9c31-402a-9692-2c04802ebe18"
$PortClassification = Get-SCPortClassification -VMMServer localhost | where {$_.Name -eq "VM 102"}

New-SCVirtualNetworkAdapter -VMMServer localhost -JobGroup 41cc0bc1-1b2b-42b5-b63e-9a3048b991cc -MACAddress "00:1D:D8:B7:1C:10" -MACAddressType Static -VirtualNetwork "vm switch" -VLanEnabled $true -VLanID 102 -Synthetic -IPv4AddressType Static -IPv6AddressType Dynamic -VMSubnet $VMSubnet -VMNetwork $VMNetwork -PortClassification $PortClassification 

$CPUType = Get-SCCPUType -VMMServer localhost | where {$_.Name -eq "3.60 GHz Xeon (2 MB L2 cache)"}

New-SCHardwareProfile -VMMServer localhost -CPUType $CPUType -Name "Profiled276eab3-d361-4014-a973-a45665637315" -Description "Profile used to create a VM/Template" -CPUCount 1 -MemoryMB 2048 -DynamicMemoryEnabled $true -DynamicMemoryMinimumMB 32 -DynamicMemoryMaximumMB 8192 -DynamicMemoryBufferPercentage 20 -MemoryWeight 5000 -CPUExpectedUtilizationPercent 20 -DiskIops 0 -CPUMaximumPercent 100 -CPUReserve 0 -NumaIsolationRequired $false -NetworkUtilizationMbps 0 -CPURelativeWeight 100 -HighlyAvailable $false -DRProtectionRequired $false -SecureBootEnabled $true -CPULimitFunctionality $false -CPULimitForMigration $false -Generation 2 -JobGroup 41cc0bc1-1b2b-42b5-b63e-9a3048b991cc 



$Template = Get-SCVMTemplate -VMMServer localhost -ID "c2dba707-7610-4d74-a733-c10a9b989a31" | where {$_.Name -eq "template-w2k12r2-02"}
$HardwareProfile = Get-SCHardwareProfile -VMMServer localhost | where {$_.Name -eq "Profiled276eab3-d361-4014-a973-a45665637315"}
$LocalAdministratorCredential = get-scrunasaccount -VMMServer "localhost" -Name "NJ Administrator" -ID "1e45f9cb-7255-4939-8223-69728257926b"

$OperatingSystem = Get-SCOperatingSystem -VMMServer localhost -ID "50b66974-c64a-4a06-b05a-7e6610c579a2" | where {$_.Name -eq "Windows Server 2012 R2 Standard"}

New-SCVMTemplate -Name "Temporary Templatef00702b2-4112-4462-8f2a-1bf1b7c9d453" -Template $Template -HardwareProfile $HardwareProfile -JobGroup edd02477-9ddd-4069-8b5c-c0d4a19ee317 -ComputerName "vm-171-01" -TimeZone 4 -LocalAdministratorCredential $LocalAdministratorCredential  -AnswerFile $null -OperatingSystem $OperatingSystem 



$template = Get-SCVMTemplate -All | where { $_.Name -eq "Temporary Templatef00702b2-4112-4462-8f2a-1bf1b7c9d453" }
$virtualMachineConfiguration = New-SCVMConfiguration -VMTemplate $template -Name "vm-171-01"
Write-Output $virtualMachineConfiguration
$vmHost = Get-SCVMHost -ID "4b12498e-5f5a-4d8c-9f65-ab5541b1222f"
Set-SCVMConfiguration -VMConfiguration $virtualMachineConfiguration -VMHost $vmHost
Update-SCVMConfiguration -VMConfiguration $virtualMachineConfiguration

$AllNICConfigurations = Get-SCVirtualNetworkAdapterConfiguration -VMConfiguration $virtualMachineConfiguration



Update-SCVMConfiguration -VMConfiguration $virtualMachineConfiguration
New-SCVirtualMachine -Name "vm-171-01" -VMConfiguration $virtualMachineConfiguration -Description "r2" -BlockDynamicOptimization $false -StartVM -JobGroup "edd02477-9ddd-4069-8b5c-c0d4a19ee317" -ReturnImmediately -StartAction "AlwaysAutoTurnOnVM" -StopAction "SaveVM"
