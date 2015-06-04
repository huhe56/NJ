.  $env:ScriptRoot\medusa\medusa-define.ps1

# environment to run medusa
# 1, add $env:scriptroot
# 2, add nj\administrator to local administrators user group
# 3, turn off all firewalls
# 4, reboot host

foreach ($vm in $vms) {
    Write-Output ""
    Write-Output "----------- $vm : $ProcessName -----------"
    Write-Output ""
    #FindProcessOnHost $vm $ProcessName
    Get-WmiObject Win32_Process -ComputerName $vm -Filter "name like '%$ProcessName%'" | select CommandLine
}



