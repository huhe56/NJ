$VHD = Get-SCVirtualHardDisk -ID "8e10dde7-6cb0-4a8c-88e9-293e57b64ed1"
$RunAsAccount = Get-SCRunAsAccount -Name "NJ Administrator" -ID "1e45f9cb-7255-4939-8223-69728257926b"
$AdminCredentials = Get-Credential

$NicProfilesArray = @()
$LogicalSwitch = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$NicProfile1 = New-SCPhysicalComputerNetworkAdapterProfile -SetAsPhysicalNetworkAdapter -LogicalSwitch $LogicalSwitch -UplinkPortProfileSet $UplinkPortProfileSet -ConsistentDeviceName "2"
$NicProfilesArray += $NicProfile1

$LogicalSwitch = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$NicProfile2 = New-SCPhysicalComputerNetworkAdapterProfile -SetAsPhysicalNetworkAdapter -LogicalSwitch $LogicalSwitch -UplinkPortProfileSet $UplinkPortProfileSet -ConsistentDeviceName "3"
$NicProfilesArray += $NicProfile2

$LogicalSwitch = Get-SCLogicalSwitch -ID "950dab48-3119-4253-9d6f-d236ab2d9048" -Name "mgmt switch"
$UplinkPortProfileSet = Get-SCUplinkPortProfileSet -ID "70d6a232-faf3-4796-992b-399e5e9bf0ac" -Name "upp host mgmt_0b9f295e-d044-4728-a38b-af988bc24b3e"
$NicProfile3 = New-SCPhysicalComputerNetworkAdapterProfile -SetAsPhysicalNetworkAdapter -LogicalSwitch $LogicalSwitch -UplinkPortProfileSet $UplinkPortProfileSet -ConsistentDeviceName "4"
$NicProfilesArray += $NicProfile3

$LogicalSwitch = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$NicProfile4 = New-SCPhysicalComputerNetworkAdapterProfile -SetAsPhysicalNetworkAdapter -LogicalSwitch $LogicalSwitch -UplinkPortProfileSet $UplinkPortProfileSet -ConsistentDeviceName "5"
$NicProfilesArray += $NicProfile4

$LogicalSwitch = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$NicProfile5 = New-SCPhysicalComputerNetworkAdapterProfile -SetAsPhysicalNetworkAdapter -LogicalSwitch $LogicalSwitch -UplinkPortProfileSet $UplinkPortProfileSet -ConsistentDeviceName "6"
$NicProfilesArray += $NicProfile5

$LogicalSwitch = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$NicProfile6 = New-SCPhysicalComputerNetworkAdapterProfile -SetAsPhysicalNetworkAdapter -LogicalSwitch $LogicalSwitch -UplinkPortProfileSet $UplinkPortProfileSet -ConsistentDeviceName "7"
$NicProfilesArray += $NicProfile6

$LogicalSwitch = Get-SCLogicalSwitch -ID "018e85fc-e975-4c90-92b9-70d50652081c" -Name "vm switch"
$UplinkPortProfileSet = Get-SCUplinkPortProfileSet -ID "8bc92936-bfcc-4019-9c9b-4f6e927f9eb6" -Name "upp vm_e8feb2b0-8faa-4348-8843-135fa798108e"
$NicProfile7 = New-SCPhysicalComputerNetworkAdapterProfile -SetAsPhysicalNetworkAdapter -LogicalSwitch $LogicalSwitch -UplinkPortProfileSet $UplinkPortProfileSet -ConsistentDeviceName "8"
$NicProfilesArray += $NicProfile7

$NicProfile8 = New-SCPhysicalComputerNetworkAdapterProfile -SetAsManagementNIC -SetAsPhysicalNetworkAdapter -UseDhcpForIPConfiguration -ConsistentDeviceName "1"
$NicProfilesArray += $NicProfile8

New-SCPhysicalComputerProfile -Name "171 with 8 vnic" -Description "windows 2012 r2 uefi " -DiskConfiguration "GPT=1:PRIMARY:QUICK:4:FALSE:OS::0:BOOTPARTITION;" -Domain "nj.vic.savbu" -TimeZone 4 -RunAsynchronously -FullName "host-171" -OrganizationName "savbu" -ProductKey "DY9TC-WNK9Y-RB343-B632C-4RFTB" -VMPaths "" -UseAsVMHost -VirtualHardDisk $VHD -BypassVHDConversion $true -DomainJoinRunAsAccount $RunAsAccount -LocalAdministratorCredential $AdminCredentials -PhysicalComputerNetworkAdapterProfile $NicProfilesArray
