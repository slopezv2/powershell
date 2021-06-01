# Object commands
Select-Object
Sort-Object
Group-Object
Where-Object
Measure-Object
Find-Module psteachingtools
#Install-Module psteachingtools
Get-Command -Noun Vegetable
Get-Vegetable
Get-Vegetable | Get-Member
Get-Vegetable | Get-Member -MemberType Properties
Get-Vegetable | Get-Member -MemberType Method
Get-Vegetable | Select-Object -Property Name,Count
Get-Vegetable | Select-Object -Property Name,C*
Get-Vegetable -RootOnly | Select-Object -First 2
Get-Vegetable  | Select-Object -First 1 -Property *
Get-Vegetable | Select-Object -Property Name -Unique # Unique names only
Get-Vegetable | Select-Object -Unique -ExpandProperty Name
Get-Vegetable | Sort-Object Count -Descending | select Count,Name
# Create custom property
Get-Vegetable | Select-Object Name,Color,@{Name="ColorValue";Expression={$_.color.value__}} | sort Color
Get-Vegetable | sort {$_.color.ToString()} -Unique
Get-Vegetable | Group-Object -Property color
Get-Vegetable | Group-Object -Property color | Get-Member
Get-Vegetable | Group-Object -Property color | sort count -Descending | select -First 1 -ExpandProperty group
Get-Vegetable | group CookedState -NoElement
# Filtering
Get-Vegetable | Where-Object -Property color -eq yellow
Get-Vegetable | where {$_.Color -eq 'yellow'}
Get-Vegetable | where {$PSItem.Color -eq 'yellow'}
Get-Help about_Comparison_Operators | more
'jeff' -ceq 'Jeff' # Powershell is not case sensitive by default, add c to comparator
'jeff' -like 'Je*'
# Regular expre..
'srv03' -match "\w+\d{1,3}"
# Complex filters
Get-Vegetable | where {$_.Count -gt 10 -and $_.Color -eq 'Green'} | `
Sort Count -Descending
# Not condition
Get-Vegetable | where {-not ($_.IsRoot) } | select name,IsRoot
# Measure command
#Slow
Measure-Command {dir C:\Windows\System32 -Recurse | Where {$_.Extension -eq '.exe'}}
# Faster
Measure-Command {dir C:\Windows\System32 -Recurse -Filter *.exe }
## Measures to calculate some numeric properties or something with text
Get-Vegetable -RootOnly | Measure-Object -Property Count -Sum 
Get-Vegetable -RootOnly | Measure-Object -Property Count -Sum | Select -ExpandProperty sum
dir C:\Windows\*.exe | measure Length -Sum -Average -Maximum -Minimum
# Process
Get-Process | Get-Member -MemberType Properties | more
Get-Process | measure WorkingSet,PeakWorkingSet -Sum -Average
# Event log
Get-EventLog -LogName System -newest 10  -EntryType Error | Select-Object Message
Get-EventLog -LogName System -newest 10  -EntryType Error | `
Select-Object TimeGenerated,Source,Message
Get-EventLog -LogName System -newest 10  -EntryType Error | `
Select-Object TimeGenerated,Source,Message | Format-List
Get-EventLog system | group Source -NoElement | `
sort Count -Descending | select -First 10 | Out-GridView
Get-Service | where {$_.Status -ne 'running' -and  $_.StartType -eq 'Automatic'} `
| Start-Service -PassThru
#ForEach-Object
#Using range operator
1..10 | ForEach-Object {$_ * 2}
Help about_ForEach
1..10 | ForEach-Object {$_ * 2} | Measure-Object -AllStats
2,4,7,8,10,39 | % {$_ / 2}
Get-Vegetable | Get-Member *peel*
Get-Vegetable Carrot | ForEach-Object { $_.Peel() }
Get-Vegetable C* | Select-Object Name,IsPeeled
cd C:\Users\selopez\repositories\powershell\SecondCourse
Get-Date | Out-File test.txt
dir tes*.txt | foreach {$_.Encrypt()}
dir | Select Name,Attributes
# ForEach enumerator
$numbers = 1..10
foreach ($n in $numbers){
    $max = Get-Random -Minimum 50 -Maximum 500
    #Set-Content -Value (1..$max) -Path "TestFile-$n.txt"
    Write-Host $max
}