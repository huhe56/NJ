.  $env:ScriptRoot\medusa\medusa-define.ps1

$MedusaTargetDisk0 = 'C:\test\medusa'
$MedusaTargetDisk1 = 'E:\test\medusa'
$MedusaTargetDisk2 = 'F:\test\medusa'
$MedusaTargetDisk3 = 'G:\test\medusa'

#$MedusaTargetDisk3 = '"\\.\PHYSICALDRIVE3"'

$loopCnt = $LoopCnt
$executionTime = $ExecutionTime
$threadCnt = $ThreadCnt
$queueDepth = $QueueDepth
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
$disk2 = @{ "target" = $MedusaTargetDisk2; 
            "loop_cnt" = $loopCnt;
            "exectution_time" = $executionTime;
            "thread_cnt" = $threadCnt;
            "queue_depth" = $queueDepth;
            "file_size" = $fileSize;
            "time_out" = $timeout
            }
$disk3 = @{ "target" = $MedusaTargetDisk3; 
            "loop_cnt" = $loopCnt;
            "exectution_time" = $executionTime;
            "thread_cnt" = $threadCnt;
            "queue_depth" = $queueDepth;
            "file_size" = $fileSize;
            "time_out" = $timeout
            }

$diskCfgs = @($disk0, $disk1, $disk2, $disk3)
