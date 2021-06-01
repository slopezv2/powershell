dir -File | where {$_.Length -ge 1mb -and $_.Extension -notmatch ".zip|.exe"} | `
ForEach-Object {
    Compress-Archive -Path $_.FullName -DestinationPath "$($_.Directory)\$($_.BaseName).zip" `
    -CompressionLevel Optimal
}
# -begin {} commands that run once before anything
# -Process {} command that run once for each object default
# -End {} commands that run once after everything is processed
dir C:\Users\selopez\Documents\Workshops\WorkshopPLUS-Data_AI-Azure_Databricks_Essentials -Directory | foreach -begin {$h=@{} ; $results=@() } `
-Process {
    $stats = dir $_.FullName -file -Recurse | Measure-Object -Property Length -Sum ;
    $h.Path = $_.FullName ; $h.Files = $stats.count;
    $h.TotalSize = $stats.sum;
    $results+=[PSCustomObject]$h
} `
-end {
    $results
} 
$results | Select-Object TotalSize  