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
Chapter 8. Objects: data by another name