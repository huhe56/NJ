# Importing the CSV-file containing the NIC configuration.

$NICs = Import-Csv "z:\config\host-122.txt" | Where-Object {$_.computername -eq $env:COMPUTERNAME}

foreach ($NIC in $NICs) {

$NetAdapter = Get-NetAdapter | Where-Object {$_.MacAddress -eq $NIC.MAC}

if ($NetAdapter) {

Write-Verbose "Found NIC $($NIC.NIC)"

 # Retrieving the network adapter you want to configure.

$NetAdapter = $NetAdapter | Rename-NetAdapter -NewName $NIC.NIC -PassThru

 # Configuring a static IP address for the NIC, if DHCP is set to false in the CSV-file

if ($NIC.DHCP -eq 'false') {

Write-Verbose "Configuring TCP/IP settings for NIC $($NIC.NIC)"

$NetAdapter = $NetAdapter | Set-NetIPInterface -DHCP Disabled -PassThru

 # Initializing empty hash table for storing NIC configuration.

$NICAttributes = @{}

 # Adding configuration properties to hash table.

if ($NIC.AddressFamily) {

$NICAttributes.Add('AddressFamily',$NIC.AddressFamily)

}

if ($NIC.IPAddress) {

$NICAttributes.Add('IPAddress',$NIC.IPAddress)

}

if ($NIC.PrefixLength) {

$NICAttributes.Add('PrefixLength',$NIC.PrefixLength)

}

if ($NIC.Type) {

$NICAttributes.Add('Type',$NIC.Type)

}

if ($NIC.DefaultGateway) {

$NICAttributes.Add('DefaultGateway',$NIC.DefaultGateway)

}

 # Configuring IP address settings by using splatting.

$NetAdapter | New-NetIPAddress @NICAttributes

 # Configuring DNS client server address, if defined in the CSV-file.

if ($NIC.DnsServerAddresses) {

Set-DnsClientServerAddress -InterfaceAlias $($NIC.NIC) -ServerAddresses $NIC.DnsServerAddresses

}

        }

    }

}