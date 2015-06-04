. Z:\scripts\medusa\define.ps1

$vms = @("vm-w2k12-131")

$ProcessName = "PowerShell"

foreach ($vm in $vms) {
    Write-Output ""
    Write-Output "----------- $vm : $ProcessName -----------"
    Write-Output ""
    $processData = Get-WmiObject Win32_Process -ComputerName $vm -Filter "name like '%$ProcessName%'" | select CommandLine, ProcessId
    foreach ($proc in $processData) {
        $cmdLine = $proc.CommandLine
        $procId = $proc.ProcessId
        #Write-Output $cmdLine
        #Write-Output $procId
        if ($cmdLine.Contains('medusa')) {
            Write-Output "=========="
            Write-Output $cmdLine
            Write-Output $procId
        }
    }
}



