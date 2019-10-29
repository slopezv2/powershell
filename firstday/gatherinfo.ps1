#Troubleshooting scenario: user cannot connect to remote computer
# Get command to see what to use
Get-Command -Name *Fire*
Get-Command -Name Get-*File*
#Info about command Get-NetFirewallRule
help Get-NetFirewallRule
# Execute command and see members
Get-NetFirewallRule | gm
Get-NetFirewallRule
#Filter by name
Get-NetFirewallRule -Name *Remote*
Get-NetFirewallRule -Name *RemoteDesktop*
# Format in table
Get-NetFirewallRule -Name *RemoteDesktop* | FT
# test change
Get-NetFirewallRule -Name *RemoteDesktop* | Set-NetFirewallRule -Enabled 'True' -WhatIf
#Gathering info
#Counters
Get-Command *counter*
# help about counter
help Get-Counter
# basic Execution
Get-Counter
# Counters about memory
Get-Counter -ListSet *memory*
Get-Counter -ListSet Memory
#Expand info
Get-Counter -ListSet Memory | Select -Expand Counter
# Get the value counter
Get-Counter -Counter "\Memory\Pages/Sec","\Memory\% Committed Bytes in Use" | FT
#WMI Object
Get-WMIObject -List *
# CIM classes
Get-CimClass -ClassName *
# Similar pieces of information
#Info about memory
Get-CimClass -ClassName *memory*
# Get specific object for memory WMI
Get-WmiObject -Class Win32_PhysicalMemory
#Same with CMI
Get-CimInstance -ClassName Win32_PhysicalMemory
# Get specific columns
Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object Tag,Capacity
#Network Troubleshooting
ipconfig /all
# Get member, no powershell command or type
ipconfig /all | Get-Member
# look for IP related commands
Get-Command *Get-NetIP*
# ip addresses from the interfaces
Get-NetIPAddress
# alias for Get-Command: GCM
GCM Get-*DNS*
GCM Get-*DNSClient*
# Check DNS client config
Get-DnsClient
# Check DNS Cache
Get-DnsClientCache
# DNS Server
Get-DnsClientServerAddress
# Get SMB related commands for check network drive
GCM *SMB*
GCM *SMBMapping
# Check examples for new SMBMapping
Help Get-SmbMapping -Examples
#Example using new Smb
New-SmbMapping -LocalPath w: -RemotePath \\DC01\Share
# Search for event commands
Get-Command get-*Event*
# Check examples for EventLog
Help Get-EventLog -Examples
Get-Eventlog -LogName system -Newest 1000 | Group-Object -Property source -noelement | Sort-Object -Property count -Descending
Get-EventLog -LogName System | Get-Member
# Get the newest 1000 events from System and filter for eventid = 1074
Get-EventLog -Log System -newest 1000 | Where-Object {$_.eventid -eq '1074'}
Get-EventLog -Log System -newest 1000 | Where-Object {$_.eventid -eq '1074'} | Format-Table machinename,username,timegenerated -AutoSize
# Get-ComputerInfo many details from CIM and WMI commands in one
Help Get-ComputerInfo
help Get-ComputerInfo -Examples
#example
Get-ComputerInfo | More
# specific memory property
Get-ComputerInfo -Property *memory*
# Files and directories
Help Get-ChildItem
Get-ChildItem -Path w:\ -Recurse
# get the members
Get-ChildItem -Path w:\ -Recurse | Get-Member
# filter by extension
Get-ChildItem -Path w:\ -Recurse | Where extension -EQ '.PNG'
Get-ChildItem -Path w:\ -Recurse | Where extension -EQ '.PNG' | Format-Table Directory,Name,LastWriteTime -AutoSize
# Copy items
Get-Command *copy*
Get-Help Copy-Item -Examples
Copy-Item w:\ -Destination c:\Cositas -Recurse -Verbose
# Get-ChildItem alias
dir c:\cositas -Recurse
# Move
Move-Item c:\cositas  -Destination c:\movedFolder -Verbose
#Rename
Rename-Item c:\movedFolder -NewName c:\RenamedFolder