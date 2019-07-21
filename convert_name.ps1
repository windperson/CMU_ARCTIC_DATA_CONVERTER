#!/usr/bin/env pwsh
# input parameter
param(
    [String]$sourceScript,
    [String]$targetScript,
    [String]$sourceWav,
    [String]$targetWav
)

$line_pattern = '^\(\s(?<file_name>[\w]+)\s(?<content>\"[\w\s.,]+\")\s\)$'

$scriptContent = Get-Content -Path $sourceScript;

$data_count = $scriptContent.Length;
$file_fomratter = "0" * $data_count.ToString().Length

Write-Output "There are total $data_count samples."

$scriptContent |
ForEach-Object -Begin { $curIndex = 1; } -Process {
    if ( $_ -match $line_pattern) {
      Add-Content -Path $targetScript -Value "$($curIndex.ToString($file_fomratter))`t$($Matches.content)\r\n";
    }; $curIndex++; };

Write-Output "Correct script file is $targetScript."
