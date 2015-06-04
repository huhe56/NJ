# ------------------------------------------------------------------------------
# Migrate Storage Wizard Script
# ------------------------------------------------------------------------------
# Script generated on Friday, May 15, 2015 11:06:43 PM by Virtual Machine Manager
# 
# For additional help on cmdlet usage, type get-help <cmdlet name>
# ------------------------------------------------------------------------------


$vm = Get-SCVirtualMachine -ID "92c8f296-424d-4554-a769-d6eb3b59cdf6" -Name "vm-171-01"

$vmHost = Get-SCVMHost | where { $_.Name -eq "host-171.nj.vic.savbu" }

Move-SCVirtualMachine -VM $vm -VMHost $vmHost -Path "F:\" -UseLAN -RunAsynchronously -UseDiffDiskOptimization -JobGroup "54b58ff6-0f50-479f-b3b1-d38b94f30a57"
