Get-Module # list all modules
Get-SmbShare
Get-Module SmbShare | Select-Object * | more
$env:PSModulePath -split ";" # Paths for auto discover modules
dir $PSHOME\modules | more
Import-Module storage
Get-Command -Module Storage | Select-Object *
Remove-Module Storage
#PowershellGet
Get-Command -Module PowerShellGet | more
Get-PSRepository
Find-Module -tag powerbi
Get-Command -Noun module
Save-Module sqlhelper -Path C:\save
Move-Item -Path C:\save\sqlhelper -Destination 'C:\Program Files\WindowsPowerShell\Modules'
