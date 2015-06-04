$HostGroup = Get-SCVMHostGroup -ID "3df732b2-4946-49e0-9dad-492ca42f6058" -Name "NJ host group"
$RunAsAccount = Get-SCRunAsAccount -Name "nj-ipmi-admin" -ID "9e637c8e-62ee-453f-884a-060f715d5e71"
$PhysicalComputerProfile = Get-SCPhysicalComputerProfile -ID "43b22d02-cc86-44c7-86ac-5ed1d9d83ad8"

$NetworkAdapterConfigs = @()
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseDhcpForIPConfiguration -SetAsManagementNIC -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-01"

$LogicalSwitch1 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet1 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$1 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-16" -LogicalSwitch $LogicalSwitch1 -UplinkPortProfileSet $UplinkPortProfileSet1
$NetworkAdapterConfigs += $1

$LogicalSwitch2 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet2 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$2 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-04" -LogicalSwitch $LogicalSwitch2 -UplinkPortProfileSet $UplinkPortProfileSet2
$NetworkAdapterConfigs += $2

$LogicalSwitch3 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet3 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$3 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-11" -LogicalSwitch $LogicalSwitch3 -UplinkPortProfileSet $UplinkPortProfileSet3
$NetworkAdapterConfigs += $3

$LogicalSwitch4 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet4 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$4 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-07" -LogicalSwitch $LogicalSwitch4 -UplinkPortProfileSet $UplinkPortProfileSet4
$NetworkAdapterConfigs += $4

$LogicalSwitch5 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet5 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$5 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-05" -LogicalSwitch $LogicalSwitch5 -UplinkPortProfileSet $UplinkPortProfileSet5
$NetworkAdapterConfigs += $5

$LogicalSwitch6 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet6 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$6 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-15" -LogicalSwitch $LogicalSwitch6 -UplinkPortProfileSet $UplinkPortProfileSet6
$NetworkAdapterConfigs += $6

$LogicalSwitch7 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet7 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$7 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-12" -LogicalSwitch $LogicalSwitch7 -UplinkPortProfileSet $UplinkPortProfileSet7
$NetworkAdapterConfigs += $7

$LogicalSwitch8 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet8 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$8 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-06" -LogicalSwitch $LogicalSwitch8 -UplinkPortProfileSet $UplinkPortProfileSet8
$NetworkAdapterConfigs += $8

$LogicalSwitch9 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet9 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$9 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-10" -LogicalSwitch $LogicalSwitch9 -UplinkPortProfileSet $UplinkPortProfileSet9
$NetworkAdapterConfigs += $9

$LogicalSwitch10 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet10 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$10 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-03" -LogicalSwitch $LogicalSwitch10 -UplinkPortProfileSet $UplinkPortProfileSet10
$NetworkAdapterConfigs += $10

$LogicalSwitch11 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet11 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$11 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-13" -LogicalSwitch $LogicalSwitch11 -UplinkPortProfileSet $UplinkPortProfileSet11
$NetworkAdapterConfigs += $11

$LogicalSwitch12 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet12 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$12 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-08" -LogicalSwitch $LogicalSwitch12 -UplinkPortProfileSet $UplinkPortProfileSet12
$NetworkAdapterConfigs += $12

$LogicalSwitch13 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet13 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$13 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-09" -LogicalSwitch $LogicalSwitch13 -UplinkPortProfileSet $UplinkPortProfileSet13
$NetworkAdapterConfigs += $13

$LogicalSwitch14 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet14 = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$14 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-14" -LogicalSwitch $LogicalSwitch14 -UplinkPortProfileSet $UplinkPortProfileSet14
$NetworkAdapterConfigs += $14

$LogicalSwitch15 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet15 = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$15 = New-SCPhysicalComputerNetworkAdapterConfig -SetAsPhysicalNetworkAdapter -MACAddress "00-25-31-71-00-02" -LogicalSwitch $LogicalSwitch15 -UplinkPortProfileSet $UplinkPortProfileSet15
$NetworkAdapterConfigs += $15

$LogicalSwitch16 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification16 = Get-SCPortClassification -ID "dbbd6d87-58a3-4a6b-a702-8158bf969bd5" -Name "VM management"
$VMNetwork16 = Get-SCVMNetwork -Name "vm medusa" -ID "822c63f6-7f11-43b8-8daa-f0a9a6933855"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "192.168.0.0/24" -LogicalSwitch $LogicalSwitch16 -PortClassification $PortClassification16 -VMNetwork $VMNetwork16

$LogicalSwitch17 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification17 = Get-SCPortClassification -ID "fc8b08ac-049b-4b67-984f-636fbd7f40cc" -Name "VM pxe linux"
$VMNetwork17 = Get-SCVMNetwork -Name "vm pxe linux" -ID "244e97e2-f8a1-4b07-9a26-99b5c8fed435"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.10.0/24" -LogicalSwitch $LogicalSwitch17 -PortClassification $PortClassification17 -VMNetwork $VMNetwork17

$LogicalSwitch18 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification18 = Get-SCPortClassification -ID "9d692f2c-8521-4ab5-81ac-17b38156d481" -Name "Live migration  workload"
$VMNetwork18 = Get-SCVMNetwork -Name "live migration network" -ID "e70a2aca-203b-48aa-b729-eec4cf95b560"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.22.0/24" -LogicalSwitch $LogicalSwitch18 -PortClassification $PortClassification18 -VMNetwork $VMNetwork18

$LogicalSwitch19 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification19 = Get-SCPortClassification -ID "435ec2f3-6fa5-4df8-9f3b-25ebac5f2b7e" -Name "Host medusa"
$VMNetwork19 = Get-SCVMNetwork -Name "host medusa" -ID "951fc612-96bf-47fb-bace-fd8175d5d951"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "192.168.0.0/24" -LogicalSwitch $LogicalSwitch19 -PortClassification $PortClassification19 -VMNetwork $VMNetwork19

$LogicalSwitch20 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification20 = Get-SCPortClassification -ID "0fe5277c-e415-47bc-b0b1-f7653abc1365" -Name "VM 102"
$VMNetwork20 = Get-SCVMNetwork -Name "vm 102" -ID "f1fb8b12-9c31-402a-9692-2c04802ebe18"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "10.10.102.0/24" -LogicalSwitch $LogicalSwitch20 -PortClassification $PortClassification20 -VMNetwork $VMNetwork20

$LogicalSwitch21 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification21 = Get-SCPortClassification -ID "dbbd6d87-58a3-4a6b-a702-8158bf969bd5" -Name "VM management"
$VMNetwork21 = Get-SCVMNetwork -Name "vm mgmt" -ID "9b126f4a-707d-4558-af5d-bcbba869bb5c"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.20.0/24" -LogicalSwitch $LogicalSwitch21 -PortClassification $PortClassification21 -VMNetwork $VMNetwork21

$LogicalSwitch22 = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$PortClassification22 = Get-SCPortClassification -ID "cf0bec7a-51e8-4920-9d2e-633c2512d0e4" -Name "VM 101"
$VMNetwork22 = Get-SCVMNetwork -Name "vm 101" -ID "f5a90f48-314b-4837-9e3b-645c05b95c19"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "10.10.101.0/24" -LogicalSwitch $LogicalSwitch22 -PortClassification $PortClassification22 -VMNetwork $VMNetwork22

$LogicalSwitch23 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification23 = Get-SCPortClassification -ID "d18b6d1a-96fe-49d0-bc44-e889109e69c5" -Name "iSCSI workload"
$VMNetwork23 = Get-SCVMNetwork -Name "iscsi network" -ID "35a0ce85-80b1-494d-ab6d-56513985bb5b"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "50.1.114.0/24" -LogicalSwitch $LogicalSwitch23 -PortClassification $PortClassification23 -VMNetwork $VMNetwork23

$LogicalSwitch24 = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$PortClassification24 = Get-SCPortClassification -ID "bdb5ca28-1f40-41e1-ab49-35e154e5962e" -Name "Host Cluster Workload"
$VMNetwork24 = Get-SCVMNetwork -Name "cluster network" -ID "734e8cc8-7df5-4de9-b944-d62c75f88d03"
$NetworkAdapterConfigs += New-SCPhysicalComputerNetworkAdapterConfig -UseStaticIPForIPConfiguration -SetAsGenericNIC -SetAsVirtualNetworkAdapter -IPv4Subnet "20.200.21.0/24" -LogicalSwitch $LogicalSwitch24 -PortClassification $PortClassification24 -VMNetwork $VMNetwork24

#$VMHostConfiguration = New-SCPhysicalComputerConfig -BMCAddress "10.193.221.218" -BMCPort 623 -BMCProtocol "IPMI" -BMCRunAsAccount $RunAsAccount -BypassADMachineAccountCheck -ComputerName "host-171" -Description "" -SMBiosGuid "00000000-0000-0000-2601-000000010701" -VMHostGroup $HostGroup -PhysicalComputerProfile $PhysicalComputerProfile -PhysicalComputerNetworkAdapterConfig $NetworkAdapterConfigs
New-SCVMHost -VMHostConfig $VMHostConfiguration -RunAsynchronously

