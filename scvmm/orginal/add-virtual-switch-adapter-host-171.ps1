$vmHost = Get-SCVMHost -ID "ce332a19-e13b-4488-9c99-88f0077c0b4b"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e" -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #3" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e" -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #4" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e" -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #6" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e" -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #7" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e" -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #8" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e" -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #9" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e" -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = @()
$oneAdapter0 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface" -VMHost $vmHost
$networkAdapter += $oneAdapter0
$oneAdapter1 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #3" -VMHost $vmHost
$networkAdapter += $oneAdapter1
$oneAdapter2 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #4" -VMHost $vmHost
$networkAdapter += $oneAdapter2
$oneAdapter3 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #6" -VMHost $vmHost
$networkAdapter += $oneAdapter3
$oneAdapter4 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #7" -VMHost $vmHost
$networkAdapter += $oneAdapter4
$oneAdapter5 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #8" -VMHost $vmHost
$networkAdapter += $oneAdapter5
$oneAdapter6 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #9" -VMHost $vmHost
$networkAdapter += $oneAdapter6
$logicalSwitch = Get-SCLogicalSwitch -Name "mgmt switch" -ID "950dab48-3119-4253-9d6f-d236ab2d9048"
New-SCVirtualNetwork -VMHost $vmHost -VMHostNetworkAdapters $networkAdapter -LogicalSwitch $logicalSwitch -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$vNicLogicalSwitch = Get-SCLogicalSwitch -Name "mgmt switch" -ID "950dab48-3119-4253-9d6f-d236ab2d9048"
$vmNetwork = Get-SCVMNetwork -Name "cluster network" -ID "734e8cc8-7df5-4de9-b944-d62c75f88d03"
$vmSubnet = Get-SCVMSubnet -VMNetwork $vmNetwork -Name "cluster network_0"
$vNICPortClassification = Get-SCPortClassification -Name "Host Cluster Workload" -ID "bdb5ca28-1f40-41e1-ab49-35e154e5962e"
$ipV4Pool = Get-SCStaticIPAddressPool -Name "cluster ip" -ID "082189ca-e888-468f-b28f-b9d8716893f5"
New-SCVirtualNetworkAdapter -VMHost $vmHost -Name "host cluster" -VMNetwork $vmNetwork -LogicalSwitch $vNicLogicalSwitch -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -VMSubnet $vmSubnet -PortClassification $vNICPortClassification -IPv4AddressType "Static" -IPv4AddressPool $ipV4Pool -MACAddressType "Static" -MACAddress "00:00:00:00:00:00"

$vNicLogicalSwitch = Get-SCLogicalSwitch -Name "mgmt switch" -ID "950dab48-3119-4253-9d6f-d236ab2d9048"
$vmNetwork = Get-SCVMNetwork -Name "live migration network" -ID "e70a2aca-203b-48aa-b729-eec4cf95b560"
$vmSubnet = Get-SCVMSubnet -VMNetwork $vmNetwork -Name "live migration network_0"
$vNICPortClassification = Get-SCPortClassification -Name "Live migration  workload" -ID "9d692f2c-8521-4ab5-81ac-17b38156d481"
$ipV4Pool = Get-SCStaticIPAddressPool -Name "live migration ip" -ID "95a90135-b500-4159-bcde-e710fe3692bd"
New-SCVirtualNetworkAdapter -VMHost $vmHost -Name "host migration" -VMNetwork $vmNetwork -LogicalSwitch $vNicLogicalSwitch -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -VMSubnet $vmSubnet -PortClassification $vNICPortClassification -IPv4AddressType "Static" -IPv4AddressPool $ipV4Pool -MACAddressType "Static" -MACAddress "00:00:00:00:00:00"

$vNicLogicalSwitch = Get-SCLogicalSwitch -Name "mgmt switch" -ID "950dab48-3119-4253-9d6f-d236ab2d9048"
$vmNetwork = Get-SCVMNetwork -Name "host medusa" -ID "951fc612-96bf-47fb-bace-fd8175d5d951"
$vmSubnet = Get-SCVMSubnet -VMNetwork $vmNetwork -Name "host medusa_0"
$vNICPortClassification = Get-SCPortClassification -Name "Host medusa" -ID "435ec2f3-6fa5-4df8-9f3b-25ebac5f2b7e"
$ipV4Pool = Get-SCStaticIPAddressPool -Name "medusa ip" -ID "0cb52b14-4a45-49e3-aa30-f9acd27d7722"
New-SCVirtualNetworkAdapter -VMHost $vmHost -Name "host medusa" -VMNetwork $vmNetwork -LogicalSwitch $vNicLogicalSwitch -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -VMSubnet $vmSubnet -PortClassification $vNICPortClassification -IPv4AddressType "Static" -IPv4AddressPool $ipV4Pool -MACAddressType "Static" -MACAddress "00:00:00:00:00:00"

$vNicLogicalSwitch = Get-SCLogicalSwitch -Name "mgmt switch" -ID "950dab48-3119-4253-9d6f-d236ab2d9048"
$vmNetwork = Get-SCVMNetwork -Name "iscsi network" -ID "35a0ce85-80b1-494d-ab6d-56513985bb5b"
$vmSubnet = Get-SCVMSubnet -VMNetwork $vmNetwork -Name "iscsi network_0"
$vNICPortClassification = Get-SCPortClassification -Name "iSCSI workload" -ID "d18b6d1a-96fe-49d0-bc44-e889109e69c5"
$ipV4Pool = Get-SCStaticIPAddressPool -Name "iscsi ip" -ID "13c9ef9a-8958-43d4-a07e-ff7c776347ba"
New-SCVirtualNetworkAdapter -VMHost $vmHost -Name "host iscsi" -VMNetwork $vmNetwork -LogicalSwitch $vNicLogicalSwitch -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -VMSubnet $vmSubnet -PortClassification $vNICPortClassification -IPv4AddressType "Static" -IPv4AddressPool $ipV4Pool -MACAddressType "Static" -MACAddress "00:00:00:00:00:00"

$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #5" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e" -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #10" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e" -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #11" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e" -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #12" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e" -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #13" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e" -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #14" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e" -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #15" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e" -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #16" -VMHost $vmHost
$uplinkPortProfileSet = Get-SCUplinkPortProfileSet -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e" -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $networkAdapter -UplinkPortProfileSet $uplinkPortProfileSet -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"
$networkAdapter = @()
$oneAdapter0 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #5" -VMHost $vmHost
$networkAdapter += $oneAdapter0
$oneAdapter1 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #10" -VMHost $vmHost
$networkAdapter += $oneAdapter1
$oneAdapter2 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #11" -VMHost $vmHost
$networkAdapter += $oneAdapter2
$oneAdapter3 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #12" -VMHost $vmHost
$networkAdapter += $oneAdapter3
$oneAdapter4 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #13" -VMHost $vmHost
$networkAdapter += $oneAdapter4
$oneAdapter5 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #14" -VMHost $vmHost
$networkAdapter += $oneAdapter5
$oneAdapter6 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #15" -VMHost $vmHost
$networkAdapter += $oneAdapter6
$oneAdapter7 = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #16" -VMHost $vmHost
$networkAdapter += $oneAdapter7
$logicalSwitch = Get-SCLogicalSwitch -Name "vm switch" -ID "018e85fc-e975-4c90-92b9-70d50652081c"
New-SCVirtualNetwork -VMHost $vmHost -VMHostNetworkAdapters $networkAdapter -LogicalSwitch $logicalSwitch -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"



$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "mgmt" -ID "9031438f-285a-4615-aabd-8795be7da876"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #3" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "mgmt" -ID "9031438f-285a-4615-aabd-8795be7da876"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #4" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "mgmt" -ID "9031438f-285a-4615-aabd-8795be7da876"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #5" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "tenant" -ID "bd5b8027-7b03-43f5-bda4-d79fd8df65d9"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #6" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "mgmt" -ID "9031438f-285a-4615-aabd-8795be7da876"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #7" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "mgmt" -ID "9031438f-285a-4615-aabd-8795be7da876"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #8" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "mgmt" -ID "9031438f-285a-4615-aabd-8795be7da876"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #9" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "mgmt" -ID "9031438f-285a-4615-aabd-8795be7da876"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #10" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "tenant" -ID "bd5b8027-7b03-43f5-bda4-d79fd8df65d9"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #11" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "tenant" -ID "bd5b8027-7b03-43f5-bda4-d79fd8df65d9"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #12" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "tenant" -ID "bd5b8027-7b03-43f5-bda4-d79fd8df65d9"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #13" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "tenant" -ID "bd5b8027-7b03-43f5-bda4-d79fd8df65d9"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #14" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "tenant" -ID "bd5b8027-7b03-43f5-bda4-d79fd8df65d9"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #15" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "tenant" -ID "bd5b8027-7b03-43f5-bda4-d79fd8df65d9"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

$vmHostNetworkAdapter = Get-SCVMHostNetworkAdapter -Name "Cisco VIC Ethernet Interface #16" -VMHost $vmHost
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -Description "" -AvailableForPlacement $true -UsedForManagement $false -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da"

$logicalNetwork = Get-SCLogicalNetwork -Name "tenant" -ID "bd5b8027-7b03-43f5-bda4-d79fd8df65d9"
Set-SCVMHostNetworkAdapter -VMHostNetworkAdapter $vmHostNetworkAdapter -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -AddOrSetLogicalNetwork $logicalNetwork

Set-SCVMHost -VMHost $vmHost -JobGroup "d15aecc1-8945-4467-a80a-7802d86661da" -RunAsynchronously -NumaSpanningEnabled $true -LiveStorageMigrationMaximum "4" -EnableLiveMigration $true -LiveMigrationMaximum "4" -MigrationPerformanceOption "UseCompression" -MigrationAuthProtocol "CredSSP" -UseAnyMigrationSubnet $true
