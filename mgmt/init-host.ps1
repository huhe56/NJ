# run in host local

#Set-ExecutionPolicy bypass -Force

Set-NetFirewallProfile -Profile Domain -Enabled False

Net Localgroup administrators /add nj\Administrator

#Net Use Z: \\20.200.20.251\test /Persistent:Yes

$env:ScriptRoot = "Z:\scripts"
