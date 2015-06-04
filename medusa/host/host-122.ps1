.  $env:ScriptRoot\medusa\medusa-define.ps1

$MedusaTargetDisk0 = 'C:\test\medusa'
$MedusaTargetDisk1 = '"\\.\PHYSICALDRIVE1"'

$loopCnt = $LoopCnt
$executionTime = $ExecutionTime
$threadCnt = $ThreadCnt
$queueDepth = 8
$fileSize = $FileSize
$timeout = $Timeout

$disk0 = @{ "target" = $MedusaTargetDisk0; 
            "loop_cnt" = $loopCnt;
            "exectution_time" = $executionTime;
            "thread_cnt" = $threadCnt;
            "queue_depth" = $queueDepth;
            "file_size" = $fileSize;
            "time_out" = $timeout
            }
$disk1 = @{ "target" = $MedusaTargetDisk1; 
            "loop_cnt" = $loopCnt;
            "exectution_time" = $executionTime;
            "thread_cnt" = $threadCnt;
            "queue_depth" = $queueDepth;
            "file_size" = $fileSize;
            "time_out" = $timeout
            }

$diskCfgs = @($disk0, $disk1)
