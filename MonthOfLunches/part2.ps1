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
#9.6. Parenthetical commands