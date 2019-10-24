# get all the started and stopped services in the machine
Get-Service
# filter
get-service | Where-Object Status -eq Stopped
# get all, filter and select specific data
Get-Service | Where-Object Status -eq Stopped | Select-Object Name, Status
# Save in a variable
$data = Get-Service | Where-Object Status -eq Stopped | Select-Object Name, Status
$data | Out-File .\services.txt
# Export as CSV
$data | Export-Csv .\services.csv
# read data from file and see paginated with more
Get-Content .\services.csv | more
# Get Powershell version
$PSVersionTable
#Count available commands:
(Get-Command).count
# Get commands by name
Get-Command -Name *DHCP*
# Get services in the specified computer
Get-Service -ComputerName T480
# Verbs available in PowerShell
Get-Verb | more
# Get specific fields from Get-Verb
get-verb | Select-Object Description, Group, AliasPrefix, Verb
# Specific info for a verb
Get-Verb -verb  Push | more
# Get services starting by M in 2 pcs
Get-Service -Name M* -ComputerName T480,DC01
# Check aliases available in System
Get-Alias | more
# Example using gsv, alias for Get-Service
gsv -Name M* -ComputerName T480,DC01
# get help about cmdlet, check the third definition to use positional parameters
help Get-Service
# Using positional parameters
gsv M* -ComputerName T480
gsv M* -Comp -T480
# Search for a command
Get-Command -Verb get -Noun *DNS*
# Search by name and type - command
Get-Command -Name *Fire* -CommandType Function
# Get-Help helps with how-tos for commands
Get-Help -Name Get-Command -Detailed
man -Name Get-Command -Detailed
Get-Help -Name *DNS*
#Update help data
Update-Help
# see examples 
Get-Help Get-Service -Examples
# Full documentation
Get-Help Get-Service -Full
# Getting about files
help *about*
help about_Aliases
# Help about Get-Command
help Get-Command
# List available commands with *DNS* in the name
Get-Command -Name *DNS*
# List commands by verb New
Get-Command -Verb New
# List commands by type
Get-Command -CommandType Function
# Some statistics based on the command
Get-Command -CommandType Function | Measure-Object
# Get from specific module
Get-Command -Name *IP* -Module NetTCPIP
# Create directory
Md C:\Users\jajano\test
mkdir C:\Users\jajano\test
# Check history 
Get-History
# Run again a line from history
Invoke-History -Id 10
# Save history
Get-History | Out-File .\history.txt
# Start a transcription, save in path and append mode if file exists
Start-Transcript -Path .\transcript.txt -Append
# Stop transcript
Stop-Transcript