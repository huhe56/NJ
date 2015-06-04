$HostGroup = Get-SCVMHostGroup -ID "3df732b2-4946-49e0-9dad-492ca42f6058" -Name "NJ host group"
$RunAsAccount = Get-SCRunAsAccount -Name "nj-ipmi-admin" -ID "9e637c8e-62ee-453f-884a-060f715d5e71"
$PhysicalComputerProfile = Get-SCPhysicalComputerProfile -ID "1ed09f5a-1b85-40ff-9d59-a7c9fdbaff42"

$NetworkAdapterConfigs = @()
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseDhcpForIPConfiguration -SetAsManagementNIC -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-51-00-01"

$LogicalSwitch1 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet1 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$1 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-51-00-02" -LogicalSwitch $LogicalSwitch1 -UplinkPortProfileSet $UplinkPortProfileSet1
$NetworkAdapterConfigs += $1

$LogicalSwitch2 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet2 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$2 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-51-00-03" -LogicalSwitch $LogicalSwitch2 -UplinkPortProfileSet $UplinkPortProfileSet2
$NetworkAdapterConfigs += $2

$LogicalSwitch3 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification3 = Get-SCPortClassification -ID "bdb5ca28-1f40-41e1-ab49-35e154e5962e" -Name "Host Cluster Workload"
$VMNetwork3 = Get-SCVMNetwork -Name "cluster network" -ID "734e8cc8-7df5-4de9-b944-d62c75f88d03"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.21.0/24" -LogicalSwitch $LogicalSwitch3 -PortClassification $PortClassification3 -VMNetwork $VMNetwork3

$LogicalSwitch4 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification4 = Get-SCPortClassification -ID "9d692f2c-8521-4ab5-81ac-17b38156d481" -Name "Live migration  workload"
$VMNetwork4 = Get-SCVMNetwork -Name "live migration network" -ID "e70a2aca-203b-48aa-b729-eec4cf95b560"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.22.0/24" -LogicalSwitch $LogicalSwitch4 -PortClassification $PortClassification4 -VMNetwork $VMNetwork4

$LogicalSwitch5 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification5 = Get-SCPortClassification -ID "435ec2f3-6fa5-4df8-9f3b-25ebac5f2b7e" -Name "Host medusa"
$VMNetwork5 = Get-SCVMNetwork -Name "host medusa" -ID "951fc612-96bf-47fb-bace-fd8175d5d951"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "192.168.0.0/24" -LogicalSwitch $LogicalSwitch5 -PortClassification $PortClassification5 -VMNetwork $VMNetwork5

$LogicalSwitch6 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification6 = Get-SCPortClassification -ID "d18b6d1a-96fe-49d0-bc44-e889109e69c5" -Name "iSCSI workload"
$VMNetwork6 = Get-SCVMNetwork -Name "iscsi network" -ID "35a0ce85-80b1-494d-ab6d-56513985bb5b"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "50.1.114.0/24" -LogicalSwitch $LogicalSwitch6 -PortClassification $PortClassification6 -VMNetwork $VMNetwork6

$LogicalSwitch7 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification7 = Get-SCPortClassification -ID "dbbd6d87-58a3-4a6b-a702-8158bf969bd5" -Name "VM management"
$VMNetwork7 = Get-SCVMNetwork -Name "vm mgmt" -ID "9b126f4a-707d-4558-af5d-bcbba869bb5c"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.20.0/24" -LogicalSwitch $LogicalSwitch7 -PortClassification $PortClassification7 -VMNetwork $VMNetwork7

$LogicalSwitch8 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification8 = Get-SCPortClassification -ID "59ddba39-5925-436c-a89f-0e564a7ab288" -Name "VM medusa"
$VMNetwork8 = Get-SCVMNetwork -Name "vm medusa" -ID "822c63f6-7f11-43b8-8daa-f0a9a6933855"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "192.168.0.0/24" -LogicalSwitch $LogicalSwitch8 -PortClassification $PortClassification8 -VMNetwork $VMNetwork8

$LogicalSwitch9 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification9 = Get-SCPortClassification -ID "cf0bec7a-51e8-4920-9d2e-633c2512d0e4" -Name "VM 101"
$VMNetwork9 = Get-SCVMNetwork -Name "vm 101" -ID "f5a90f48-314b-4837-9e3b-645c05b95c19"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "10.10.101.0/24" -LogicalSwitch $LogicalSwitch9 -PortClassification $PortClassification9 -VMNetwork $VMNetwork9

$LogicalSwitch10 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification10 = Get-SCPortClassification -ID "0fe5277c-e415-47bc-b0b1-f7653abc1365" -Name "VM 102"
$VMNetwork10 = Get-SCVMNetwork -Name "vm 102" -ID "f1fb8b12-9c31-402a-9692-2c04802ebe18"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "10.10.102.0/24" -LogicalSwitch $LogicalSwitch10 -PortClassification $PortClassification10 -VMNetwork $VMNetwork10

$LogicalSwitch11 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification11 = Get-SCPortClassification -ID "fc8b08ac-049b-4b67-984f-636fbd7f40cc" -Name "VM pxe linux"
$VMNetwork11 = Get-SCVMNetwork -Name "vm pxe linux" -ID "244e97e2-f8a1-4b07-9a26-99b5c8fed435"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.10.0/24" -LogicalSwitch $LogicalSwitch11 -PortClassification $PortClassification11 -VMNetwork $VMNetwork11

$VMHostConfiguration = New-SCPhysicalComputerConfig -BMCAddress "10.193.221.219" -BMCPort 623 -BMCProtocol "IPMI" -BMCRunAsAccount $RunAsAccount -BypassADMachineAccountCheck -ComputerName "host-151" -Description "" -SMBiosGuid "00000000-0000-0000-2601-000000010501" -VMHostGroup $HostGroup -PhysicalComputerProfile $PhysicalComputerProfile -PhysicalComputerNetworkAdapterConfig $NetworkAdapterConfigs
New-SCVMHost -VMHostConfig $VMHostConfiguration -RunAsynchronously

