1..10 | ForEach-Object -Process { $_ * 2}
Get-Vegetable -RootOnly | foreach {$_.Peel(); Get-Vegetable $_.Name | Select name,IsPeeled}
# Total size  and file counts
dir C:\DIAD -Recurse -File | where {$_.Length -ge 500 -and $_.Extension -notmatch ".zip|.exe"} | foreach {
    $file = Join-Path -Path $_.Directory -ChildPath "$($_.BaseName).zip"    
    Compress-Archive -Path $_.FullName -DestinationPath $file -CompressionLevel Optimal -Force
}
dir C:\DIAD -Recurse -Directory | 
foreach -Begin { $h = @{}; $results = @()} -Process {
    $stat = dir $_.FullName -File -Recurse | Measure-Object -Property Length -Sum
    $h.Path = $_.FullName
    $h.Files = $stat.Count
    $h.TotalSize = $stat.Sum
    $results += [PSCustomObject]$h   
} -End {
    $results
}
# Commands
Get-Command -Noun Service
# Pipe and foreach
$r = foreach($n in $numbers) {$n + 3 }
$r | sort -Descending
$numbers | foreach-object  {$_ + 3 } | Sort -Descending
# Out Commands
Get-Command -Verb Out
Get-Service | sort Status,Name | Out-File C:\DIAD\file.txt -NoClobber #No duplicate
# Event log with output as PDF
Get-EventLog System -Newest 10 -EntryType error | select TimeGenerated,Source,Message| Format-List | Out-Printer "Microsoft Print to pdf"
Invoke-Item "C:\descargas\jaja.pdf"
# Graphic interfaces
$logs = Get-EventLog -List | Select-Object LogDisplayName | Out-GridView -Title "Select one or more logs" -OutputMode Multiple
# Capture single selection
$count = 1,10,25,50 | Out-GridView -Title "How many entries?" -OutputMode Single
$printer = Get-Printer | Select-Object Name | Out-GridView -Title "Select a printer" -OutputMode Single
# Tee command
# Saves command output in a file or variable and also sends it down the pipeline
Get-Process | sort WS -Descending | Select -First 10 | Tee-Object -FilePath C:\Users\selopez\Downloads\ejemploproc.txt
## Pipeline in depth
