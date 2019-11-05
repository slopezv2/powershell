#Requirements:
Get-Service -ComputerName Client02
#Create remote Session
Enter-PSSession -ComputerName Client02
#Configure client02
Enable-PSRemoting -Force
Set-PSSessionConfiguration -Name Microsoft.PowerShell -ShowSecurityDescriptorUI
#in the GUI, assing the user or security group as local administrator
# Check firewall rule for Windows Management Instrumentation
Get-NetFirewallRule | Where-Object DisplayName -Like "*Windows Instrumentation Management*" | Set-NetFirewallRule -Enable True -Verbose
#Same for Remote Service Management
Get-NetFirewallRule | Where-Object DisplayName -Like "*Remote Service Management*" | Set-NetFirewallRule -Enable True -Verbose
# Check in client01
Get-Service -ComputerName Client02
Enter-PSSession -ComputerName client02
# Variables
# Access available variables
Get-ChildItem ENV: | more
#Access specific variable
$ENV:COMPUTERNAME
#Show variables in the console
Get-Variable | more
#PSVersionTable
$PSVersionTable
# example assign value
$RemotePC = "Client2"
Write-Output "The name of the remote pc is $RemotePC" 
# Single quotes:
Write-Output 'The name of the remote pc is $RemotePC'
# Save credentials
$credential = Get-Credential  -Message "Hello, please your email and password"
$credential
# Search variable
Get-Variable -Name c*
Get-Service -ComputerName $computerName
# Remote example
$ComputerName = "client02"
Get-Service -ComputerName $ComputerName | Select-Object Name,Status
gcm *-PSSession
$credential = Get-Credential
New-PSSession -ComputerName $computerName -Credential $credential
#enter to the session
Enter-PSSession -Name WinRM1
#Get PS sessions
Get-PSSession
Enter-PSSession -Id 1
# Remove session
Remove-PSSession
Get-Help Invoke-Command
# fails because $computerName is not define in client02
Invoke-Command -ComputerName $computerName -Credential $credential -ScriptBlock { Get-Service -ComputerName $computerName }
# Executes well
Invoke-Command -ComputerName $computerName -Credential $credential -ScriptBlock { Get-Service -ComputerName $using:ComputerName }
# save in variable
$data = Invoke-Command -ComputerName $computerName -Credential $credential -ScriptBlock { Get-Service -ComputerName $using:ComputerName }
$data | Get-Member
#CIMSession
Help New-CimSession
$CimSession = New-CimSession -ComputerName $computerName -Credential $credential
$CimSession
# Check available Cim Sessions
Get-CimSession
Help Get-DnsClientServerAddress
Get-DnsClientServerAddress -CimSession $CimSession