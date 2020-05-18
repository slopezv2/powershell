Update-Help
#Export help
Save-Help
#Import help in other pc
Update-Help -Source "<LOCATION>"
# get help
Help *log*
# Get the assigned alias for a command
Get-Alias -Definition "Get-Service"
## gsv
gsv
#alias managemente
New-Alias
Import-Alias
Export-Alias
#Using Parameter Name aliases
(Get-Command Get-EventLog | select -ExpandProperty parameters).computername.aliases
# Struggling with a command? Show-Command to use a GUI
Show-Command Get-EventLog
# New command to test connection
Test-Connection "www.google.com.co"
<# PSProviders: Is an adapter. It's designed to take some kind of data storage and make it
look  like a disk drive
#>
Get-PSProvider
<# Capabilities:
* ShouldProcess: The provider supports the use of -WhatIf and Confirm
* Filter: -Filter param to manipulate provider content
* Credentials: -Alternate credentials when connecting to data stores
* Transactions:  rollback or commit  changes as a single unit
#>
#Currently connected drive
Get-PSDrive
# Change locations:
Set-Location -Path C:\Windows
# alias fro change location: cd
cd C:\Users\selopez\Documents
New-Item testFolder -ItemType Directory
# alias mkdir
# found something
Get-ChildItem *.exe
# Literal path, not regex available
Get-ChildItem -LiteralPath C:\Users\selopez\file$.txt
# going to the registry HKEY_CURRENT_USER
Set-Location -Path hkcu:
Set-Location -Path software
Get-ChildItem
Set-Location .\Microsoft\Windows
Set-ItemProperty -Path dwm -PSProperty EnableAeroPeek -Value 0
Set-Location C:\temp
New-Item -Path C:\temp -Name test.txt -ItemType File
# Chapter 6 
# Pipeline
dir | more
Get-Process # gps
Get-Service # gsv
Get-EventLog Security -Newest 10 # admin privileges
Get-Process | Export-Csv procs.csv -NoTypeInformation
help Export-Csv
# Import data
Import-Csv procs.csv
# Exporting and importing to xml
Get-Process | Export-CliXML procs.xml
Import-Clixml procs.xml
# Looking for more import and export options
Get-Command -Name *Import*
# Diff method
help diff 
Compare-Object -ReferenceObject $(Get-Content test1.txt) -DifferenceObject $(Get-Content test2.txt)
Compare-Object -ReferenceObject $(Get-Content test1.txt) -DifferenceObject $(Get-Content test2.txt) -IncludeEqual
# Piping to a file or a printer
dir > DirectoryList.txt
## translated to:
dir | Out-File DirectoryList.txt
help Out-File
# Gettting commands by verb
Get-Command -Verb Out
# Grid view available in Windows 
Get-Service | Out-GridView
# Converting to HTML
Get-Service | ConvertTo-HTML > services.html
# Stoping processes. Stop notepad
Get-Process -name Notepad | Stop-Process
# Preference level in PowerShell, to check what kind of commands are possible to run
$confirmpreference
# commands with confirmation, please do not say yes:
Get-Service | Stop-Service -confirm
# Whatif version
get-process | stop-process –whatif