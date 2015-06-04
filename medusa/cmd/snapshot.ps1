.  $env:ScriptRoot\medusa\medusa-define.ps1

$sourceDir = "C:\Windows"
$sourceImage = "explorer.exe"
$targetDir = "C:\test"

$sourceImagePath = "$sourceDir\$sourceImage"
$targetImagePath = "$targetDir\$sourceImage"

foreach ($vm in $vms) {
    Write-Output ""
    Write-Output "----------- $vm : Remove-Item -----------"
    Write-Output ""
    Invoke-Command -ComputerName $vm -ScriptBlock { 
        param ($targetImagePath)
        if (Test-Path $targetImagePath) {
            Remove-Item -Force $targetImagePath
        } 
    } -ArgumentList $targetImagePath
}

foreach ($vm in $vms) {
    Write-Output ""
    Write-Output "----------- $vm : New-SCVMCheckpoint -----------"
    Write-Output ""
    New-SCVMCheckpoint -VM $vm
}

$resultMap = @{}
foreach ($vm in $vms) {
    Write-Output ""
    Write-Output "----------- $vm : Copy-Item -----------"
    Write-Output ""
    $result = Invoke-Command -ComputerName $vm -ScriptBlock { 
        param ($sourceImagePath, $targetDir, $targetImagePath)
        Copy-Item -Force $sourceImagePath $targetDir 
        return Test-Path $targetImagePath
    } -ArgumentList $sourceImagePath, $targetDir, $targetImagePath
    $resultMap[$vm] = $result
}

$title = "copy image to $targetImagePath"
PrintResults $title $resultMap

$resultMap = @{}
foreach ($vm in $vms) {
    Write-Output ""
    Write-Output "----------- $vm : Restore-SCVMCheckpoint -----------"
    Write-Output ""
    Get-SCVMCheckpoint -VM $vm -MostRecent | Restore-SCVMCheckpoint
    $result = Invoke-Command -ComputerName $vm -ScriptBlock { 
        param ($targetImagePath)
        return Test-Path $targetImagePath
    } -ArgumentList $targetImagePath
    $resultMap[$vm] = ! $result
}

$title = " Should not find $targetImagePath"
PrintResults $title $resultMap



