$HostGroup = Get-SCVMHostGroup -ID "3df732b2-4946-49e0-9dad-492ca42f6058" -Name "NJ host group"
$RunAsAccount = Get-SCRunAsAccount -Name "nj-ipmi-admin" -ID "9e637c8e-62ee-453f-884a-060f715d5e71"
$PhysicalComputerProfile = Get-SCPhysicalComputerProfile -ID "fa0098af-74bb-4956-b601-f2ad0bf2a7a9"

$NetworkAdapterConfigs = @()
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseDhcpForIPConfiguration -SetAsManagementNIC -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-41-00-01"

$LogicalSwitch1 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet1 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$1 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-41-00-08" -LogicalSwitch $LogicalSwitch1 -UplinkPortProfileSet $UplinkPortProfileSet1
$NetworkAdapterConfigs += $1

$LogicalSwitch2 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet2 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$2 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-41-00-02" -LogicalSwitch $LogicalSwitch2 -UplinkPortProfileSet $UplinkPortProfileSet2
$NetworkAdapterConfigs += $2

$LogicalSwitch3 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet3 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$3 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-41-00-03" -LogicalSwitch $LogicalSwitch3 -UplinkPortProfileSet $UplinkPortProfileSet3
$NetworkAdapterConfigs += $3

$LogicalSwitch4 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet4 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$4 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-41-00-04" -LogicalSwitch $LogicalSwitch4 -UplinkPortProfileSet $UplinkPortProfileSet4
$NetworkAdapterConfigs += $4

$LogicalSwitch5 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet5 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$5 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-41-00-07" -LogicalSwitch $LogicalSwitch5 -UplinkPortProfileSet $UplinkPortProfileSet5
$NetworkAdapterConfigs += $5

$LogicalSwitch6 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet6 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$6 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-41-00-05" -LogicalSwitch $LogicalSwitch6 -UplinkPortProfileSet $UplinkPortProfileSet6
$NetworkAdapterConfigs += $6

$LogicalSwitch7 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet7 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$7 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-41-00-06" -LogicalSwitch $LogicalSwitch7 -UplinkPortProfileSet $UplinkPortProfileSet7
$NetworkAdapterConfigs += $7

$LogicalSwitch8 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification8 = Get-SCPortClassification -ID "d18b6d1a-96fe-49d0-bc44-e889109e69c5" -Name "iSCSI workload"
$VMNetwork8 = Get-SCVMNetwork -Name "iscsi network" -ID "35a0ce85-80b1-494d-ab6d-56513985bb5b"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "50.1.114.0/24" -LogicalSwitch $LogicalSwitch8 -PortClassification $PortClassification8 -VMNetwork $VMNetwork8

$LogicalSwitch9 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification9 = Get-SCPortClassification -ID "bdb5ca28-1f40-41e1-ab49-35e154e5962e" -Name "Host Cluster Workload"
$VMNetwork9 = Get-SCVMNetwork -Name "cluster network" -ID "734e8cc8-7df5-4de9-b944-d62c75f88d03"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.21.0/24" -LogicalSwitch $LogicalSwitch9 -PortClassification $PortClassification9 -VMNetwork $VMNetwork9

$LogicalSwitch10 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification10 = Get-SCPortClassification -ID "9d692f2c-8521-4ab5-81ac-17b38156d481" -Name "Live migration  workload"
$VMNetwork10 = Get-SCVMNetwork -Name "live migration network" -ID "e70a2aca-203b-48aa-b729-eec4cf95b560"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.22.0/24" -LogicalSwitch $LogicalSwitch10 -PortClassification $PortClassification10 -VMNetwork $VMNetwork10

$LogicalSwitch11 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification11 = Get-SCPortClassification -ID "435ec2f3-6fa5-4df8-9f3b-25ebac5f2b7e" -Name "Host medusa"
$VMNetwork11 = Get-SCVMNetwork -Name "host medusa" -ID "951fc612-96bf-47fb-bace-fd8175d5d951"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "192.168.0.0/24" -LogicalSwitch $LogicalSwitch11 -PortClassification $PortClassification11 -VMNetwork $VMNetwork11

$VMHostConfiguration = New-SCPhysicalComputerConfig -BMCAddress "10.193.221.220" -BMCPort 623 -BMCProtocol "IPMI" -BMCRunAsAccount $RunAsAccount -BypassADMachineAccountCheck -ComputerName "host-141" -Description "" -SMBiosGuid "00000000-0000-0000-2601-000000010401" -VMHostGroup $HostGroup -PhysicalComputerProfile $PhysicalComputerProfile -PhysicalComputerNetworkAdapterConfig $NetworkAdapterConfigs
New-SCVMHost -VMHostConfig $VMHostConfiguration -RunAsynchronously

