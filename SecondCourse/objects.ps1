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