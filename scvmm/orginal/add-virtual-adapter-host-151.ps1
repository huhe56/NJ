$vmHost = Get-SCVMHost -ID "e0000a92-9ec3-4a78-bfba-39e07f7a8e26"



$vNicLogicalSwitch = Get-SCLogicalSwitch -Name "mgmt switch" -ID "950dab48-3119-4253-9d6f-d236ab2d9048"
$vmNetwork = Get-SCVMNetwork -Name "cluster network" -ID "734e8cc8-7df5-4de9-b944-d62c75f88d03"
$vmSubnet = Get-SCVMSubnet -VMNetwork $vmNetwork -Name "cluster network_0"
$vNICPortClassification = Get-SCPortClassification -Name "Host Cluster Workload" -ID "bdb5ca28-1f40-41e1-ab49-35e154e5962e"
$ipV4Pool = Get-SCStaticIPAddressPool -Name "cluster ip" -ID "082189ca-e888-468f-b28f-b9d8716893f5"
New-SCVirtualNetworkAdapter -VMHost $vmHost -Name "host cluster" -VMNetwork $vmNetwork -LogicalSwitch $vNicLogicalSwitch -JobGroup "f1962697-89f1-44a1-9f33-8d673c8532c5" -VMSubnet $vmSubnet -PortClassification $vNICPortClassification -IPv4AddressType "Static" -IPv4AddressPool $ipV4Pool -MACAddressType "Static" -MACAddress "00:00:00:00:00:00"

$vNicLogicalSwitch = Get-SCLogicalSwitch -Name "mgmt switch" -ID "950dab48-3119-4253-9d6f-d236ab2d9048"
$vmNetwork = Get-SCVMNetwork -Name "iscsi network" -ID "35a0ce85-80b1-494d-ab6d-56513985bb5b"
$vmSubnet = Get-SCVMSubnet -VMNetwork $vmNetwork -Name "iscsi network_0"
$vNICPortClassification = Get-SCPortClassification -Name "iSCSI workload" -ID "d18b6d1a-96fe-49d0-bc44-e889109e69c5"
$ipV4Pool = Get-SCStaticIPAddressPool -Name "iscsi ip" -ID "13c9ef9a-8958-43d4-a07e-ff7c776347ba"
New-SCVirtualNetworkAdapter -VMHost $vmHost -Name "host iscsi" -VMNetwork $vmNetwork -LogicalSwitch $vNicLogicalSwitch -JobGroup "f1962697-89f1-44a1-9f33-8d673c8532c5" -VMSubnet $vmSubnet -PortClassification $vNICPortClassification -IPv4AddressType "Static" -IPv4AddressPool $ipV4Pool -MACAddressType "Static" -MACAddress "00:00:00:00:00:00"



Set-SCVMHost -VMHost $vmHost -JobGroup "f1962697-89f1-44a1-9f33-8d673c8532c5" -RunAsynchronously -LiveStorageMigrationMaximum "4" -EnableLiveMigration $true -LiveMigrationMaximum "4" -MigrationPerformanceOption "UseCompression" -MigrationAuthProtocol "CredSSP" -UseAnyMigrationSubnet $true
