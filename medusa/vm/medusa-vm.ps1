.  $env:ScriptRoot\medusa\medusa-define.ps1

$hostName = Get-WMIObject Win32_ComputerSystem | Select-Object -ExpandProperty name
$diskID   = -1

$TargetDir = "C:\test\medusa"

$loopCnt = $LoopCnt
$executionTime = 3600
$threadCnt = 1
$queueDepth = 4
$fileSize = $FileSize
$timeout = $Timeout

$disk0 = @{ "target" = $TargetDir; 
            "loop_cnt" = $loopCnt;
            "exectution_time" = $executionTime;
            "thread_cnt" = $threadCnt;
            "queue_depth" = $queueDepth;
            "file_size" = $fileSize;
            "time_out" = $timeout
            }


$diskCfgs = @($disk0)

RunMedusa $hostName $diskID $diskCfgs