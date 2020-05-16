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
#5.2. Understanding how the filesystem is organized