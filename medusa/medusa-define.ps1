. $env:ScriptRoot\define.ps1

$vms = GetAllVMNameList

$vms = GetRutgersVMNameListFromHost "141"
$vms += GetRutgersVMNameListFromHost "131"

#$vms = GetNewarkVMNameListFromHost "171"
$vms = GetNewarkVMNameListFromHost "151"

echo $vms

$scriptKeyword = "medusa-vm.ps1"

$BlockSizes = @("512b", "1k", "2k", "4k", "8k", "16k", "32k", "64k", "128k", "256k", "512k", "1024k") | Sort-Object {Get-Random}
$AccessOrderModeBlocks = @("-m17", "-m18")   | Sort-Object {Get-Random}
$AccessOrderModeFiles  = @("-%x100", "-m18") | Sort-Object {Get-Random}
$AccessTypeModes   = @("-r", "-w", "")   | Sort-Object {Get-Random}

$FileSize = ""

$LoopCnt = 1
$ThreadCnt = 4
$QueueDepth = 4
$Timeout = 120
$ExecutionTime = 600

$MedusaScriptRootDir = "z:\scripts\medusa"

# medusa execution current directory, which is on the automation server \\20.200.20.251\test
$HostMedusaExecutionRootDir = "Z:\log\medusa"

$ProcessName = "maim"

Function RunMedusa($hostName, $diskID, $diskCfgs) {
    if ($diskCfgs.length -lt $diskID + 1) {
        Write-Output "Warning: disk$diskID not configured in $hostName.ps1 definition file, exit!"
        Write-Output ""
        return
    }
    $diskCfg = IIF ($diskID -eq -1) $diskCfgs[0] $diskCfgs[$diskID]
    $target = $diskCfg["target"]
    $loopCnt = $diskCfg["loop_cnt"]
    $executionTime = $diskCfg["exectution_time"]
    $threadCnt = $diskCfg["thread_cnt"]
    $queueDepth = $diskCfg["queue_depth"]
    $fileSize = $diskCfg["file_size"]
    $timeout = $diskCfg["time_out"]
    $isBlockDisk = IIf $target.ToLower().Contains("physicaldrive") $true $false
    Write-Output ""
    write-output "==================================================================================="
    Write-Output "Host Name: $hostName; Disk ID: $diskID; Target: $target; Block Device: $isBlockDisk"
    write-output "==================================================================================="
    Write-Output ""
    $accessOrderModes = $null
    $logHostDiskDir = $null
    if ($diskID -eq -1) {
        # vm
        $accessOrderModes = $AccessOrderModeFiles
        $logHostDiskDir = "$HostMedusaExecutionRootDir\vm\$hostName"
        New-Item -Force -ItemType directory -Path $logHostDiskDir
        New-Item -Force -ItemType directory -Path $target
        $target = "$target\vm-test.dat"
    }
    else {
        # host
        if ($isBlockDisk) {
            $accessOrderModes = $AccessOrderModeBlocks
        }
        else {
            $accessOrderModes = $AccessOrderModeFiles
            New-Item -Force -ItemType directory -Path $target
            $target = "$target\host-test.dat"
        }
        # pre-created directory
        $logHostDiskDir = "$HostMedusaExecutionRootDir\host\$hostName\disk$diskID"   
        New-Item -Force -ItemType directory -Path $logHostDiskDir
    } 
    Remove-Item "$logHostDiskDir\*" -Force -Recurse

    for ($i = 0; $i -lt $loopCnt; $i++) {
        Write-Output ""
        Write-Output "---------------------------- $i -----------------------------"
        Write-Output ""
        foreach ($blockSize in $BlockSizes) {
            foreach ($accessOrderMode in $accessOrderModes) {
                foreach ($accessTypeMode in $AccessTypeModes) {
                    
                    $cmd = "maim -d$executionTime -M$timeout -o -t$threadCnt -Q$queueDepth $accessOrderMode $accessTypeMode -b$blockSize $fileSize -f$target"
                    Write-Output "cd $logHostDiskDir;  $cmd"
                    iex "cd $logHostDiskDir; $cmd"

                    $testRunDir = "$loopCnt$accessTypeMode$accessOrderMode-$blockSize"
                    $saveDir = "$logHostDiskDir\$testRunDir"
                    Write-Output "$saveDir"
                    New-Item -Force -ItemType directory -Path $saveDir
                    Move-Item -force "$logHostDiskDir\host*" $saveDir
                    Move-Item -force "$logHostDiskDir\vm*" $saveDir

                    Start-Sleep 10
                    Write-Output "releasing maim license ..."
                    iex "maim -Z0"
                }
            }
        }
    }
}