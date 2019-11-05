#Check execution policy
Get-ExecutionPolicy
# Get help to change Execution policy
Get-Help Set-ExecutionPolicy -Parameter ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
# Read from user
$ComputerName = Read-Host 'Enter the name of the host'
# Connect read pc info
Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $ComputerName | Select-Object -Property CSName,LastBootUpTime
# Read parameters
#Creates a mandatory parameter for computername and service status
Param ([Parameter(Mandatory=$True)][string[]] $ComputerName)
$Services = Get-Service -ComputerName $ComputerName
# Use foreach construct to perform actions on each object in $Services
ForEach ($service in $Services){
    $ServiceStatus = $service.status
    $ServiceDisplayName = $service.displayName

    #Comparisson if - else
    if ($ServiceStatus -eq 'Running'){
        Write-Output "Service OK - Status of $ServiceDisplayName is $ServiceStatus"
    }
    Else {
        Write-Output "Check Service - Status of $ServiceDisplayName is $ServiceStatus"
    }
}
# Information to gather in Script
# OS Description
$OS = (Get-CimInstance Win32_OperatingSystem -ComputerName SELOPEZ-T480).Caption
#Disk freespace on OS Drive
$drive = Get-WMIObject -Class Win32_logicalDisk | Where-Object DeviceID -EQ 'C:'
$FreeSpace = (($drive.Freespace) / 1gb)
$drive
$FreeSpace
#Amount of System memory
$MemoryInGB = ((((Get-CimInstance -Class Win32_PhysicalMemory -ComputerName SELOPEZ-T480).Capacity | Measure-Object -Sum).Sum)/1GB)
$MemoryInGB
#LastReboot
$LastReboot = (Get-CimInstance Win32_OperatingSystem -ComputerName SELOPEZ-T480).LastBootUpTime
$LastReboot
#IP Address & DNS Name
$DNS = Resolve-DnsName -Name SELOPEZ-T480 | Where-Object Type  -EQ "A"
$DNSName = $DNS.Name
$DNSIP = $DNS.IPAddress
$DNS
$DNSName
$DNSIP
# DNS Server of Target
$CimSession = New-CimSession -ComputerName SELOPEZ-T480 -Credential (Get-Credential)
(Get-DnsClientServerAddress -CimSession $CimSession -InterfaceAlias "ethernet" -AddressFamily IPv4).ServerAddresses
## How to document a script:
<#
.Synopsis
    Short Desc.
.Description
    Long Descr.
.EXAMPLE
    Example 1 how to use it
.EXAMPLE
    Example 2. How to use it
#>
# script name
# Author
# Created at:
# updated at:
# Updates:
# References:
# Parameters:
# Variables:
# Commands
# Write Output to screen