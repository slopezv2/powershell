Get-PSSnapin -Registered
# add-pssnapin sqlservercmdletsnapin100 # to add snapin
# get commands
Get-Command -pssnapin sqlservercmdletsnapin100
Get-Help *network*
Get-Help Get-SmbServerNetworkInterface
## using modules
Import-Module -Name DnsClient
get-Command -Module DnsClient
Get-Help Clear-DnsClientCache -Verbose # More details in component
####### Objects
Get-Process | Get-Member
# Sorting 
Get-Process | Sort-Object -Property VM -desc
# Filtering properties
Get-Process | Select-Object -Property Name,ID,VM,PM
Get-Process | Get-Member | Get-Member
# Random
Get-Random
# Current date-time 
Get-Date
# Hotfixes
Get-HotFix | Sort-Object InstalledOn | Select-Object InstalledOn,InstalledBy,HotFixID
# getting the services for a pc in a file and addiing properties
Get-Content .\computers.txt | Get-Service
Get-Process -Name note* | Stop-Process
Import-Csv .\newUser.csv |
Select-Object -Property *, 
@{name = "SamAccountName"; expression = {$_.login}},
@{label = 'Name'; expression = {$_.login}},
@{n='Department'; e={$_.Dept}} |
New-AdUser
## Chapter 10
# Formatting system
cd $pshome
notepad .\DotNetTypes.format.ps1xml
Get-Process | Get-Member
# When there is not a default view
Get-WmiObject Win32_OperatingSystem | Gm
Get-WmiObject Win32_OperatingSystem
# Formatting tables
Format-Table # first way
# Autosize:
Get-WmiObject Win32_BIOS | Format-Table -autoSize
Get-Process | Format-Table -property ID,Name,Responding -autoSize
Get-Service | Sort-Object Status | Format-Table -groupBy Status
#Preserve all the data with wrap
Get-Service | Format-Table Name,Status,DisplayName -autoSize -wrap
# Format list
Get-Service | Format-List *
# Formatting wide list: It's able to display only the values of a single property, so its -property
# parameter accepts only one property name
Get-Process | Format-Wide name -column 4 # Format to show 4 columns
Get-Process | Format-Wide name -column 2
# Format-Table and Format-List can use hash tables to create custom table columns or
# custom list entries
Get-Service | Format-Table @{name='ServiceName';Expression={$_.Name}},Status,DisplayName
Get-Process | Format-Table Name,@{name='VM(GB)';expression={$_.VM / 1GB -as [int]}} -autosize
# Extra properties
Get-Process | Format-Table Name,@{name='VM(MB)'; expression={$_.VM / 1MB};formatstring='F2'; align='right'} -AutoSize
#Do not do this because both outputs are merged
Get-Process; Get-Service
dir c:\windows\*.exe | Format-list Name,VersionInfo,@{Name="Size";Expression={$_.length}}
#Chapter 11. Filtering and comparisons