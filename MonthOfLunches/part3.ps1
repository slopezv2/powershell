Get-Privilege
## Chapter 13. Remote control: one-to-one, and one-to-many
# Enable remoting session
Enable-PSRemoting
# Cambio de puerto para conexión remota
Winrm set winrm/config/listener?Address=*+Transport=HTTP
@{Port="1234"}
# Start session
Enter-PSSession -computerName Server-R2
# One to many commands
Invoke-Command -computerName Server-R2,Server-DC4,Server12 -command { Get-EventLog Security -newest 200 | Where { $_.EventID -eq 1212 }}
# Chapter 14. Using Windows Management Instrumentation and CIM