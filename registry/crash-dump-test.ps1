. $env:ScriptRoot\define.ps1

$HostId = '122'

$CompleteMemoryDump = "0x1"
$KenerlMemoryDump = "0x2"
$SmallMemoryDump = "0x3"

$RegistryPath = "HKLM:\System\CurrentControlSet\Control\CrashControl"
$RegistryName = "CrashDumpEnabled"

$MinidumpDir = "C:\Windows\Minidump"
$MemoryDumpPath = "C:\Windows\MEMORY.DMP"

function GetRegistryValue($path, $name) {
    Get-ItemProperty -Path $path -Name $name
}

function SetRegistryValue($path, $name, $value) {
    Set-ItemProperty -Path $path -Name $name -Value $value
}

#GetRegistryValue $RegistryPath $RegistryName
#SetRegistryValue $RegistryPath $RegistryName '3'
#GetRegistryValue $RegistryPath $RegistryName

$hostName = "host-$HostId"

Invoke-Command -ComputerName $hostName -ScriptBlock { cd C:\Windows; del MEMORY.DMP; del Minidump/* }

$cmdlet = "Get-ItemProperty"
$param = @{"Path"=$RegistryPath; "Name"=$RegistryName}
StartCmdletOnHost $hostName $cmdlet $param

$cmdlet = "Set-ItemProperty"
$param = @{"Path"=$RegistryPath; "Name"=$RegistryName; "Value"=1}
StartCmdletOnHost $hostName $cmdlet $param

$cmdlet = "Get-ItemProperty"
$param = @{"Path"=$RegistryPath; "Name"=$RegistryName}
StartCmdletOnHost $hostName $cmdlet $param

$cmdlet = "Get-Process | Stop-Process -Force"
$param = @{}
StartCmdletOnHost $hostName $cmdlet $param

$isUp = WaitForHostUp $hostName 180

Start-Sleep 30

if ($isUp) {
    Invoke-Command -ComputerName $hostName -ScriptBlock { cd C:\Windows; dir MEM*; dir Minidump/* }
}
else {
    Write-Output "FAILED: can't find the dump file"
}
