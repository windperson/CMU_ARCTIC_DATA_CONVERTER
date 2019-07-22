#!/usr/bin/env pwsh
# input parameter
param(
    [String]$sourceScript,
    [String]$targetScript,
    [String]$wavSource,
    [String]$wavTarget
)

$line_pattern = "^\(\s(?<file_name>[\w]+)\s(?<content>\`"[\w\s.,;\'-]+\`")\s\)$"

$scriptContent = Get-Content -Path $sourceScript;

$data_count = $scriptContent.Length;
$file_fomratter = "0" * $data_count.ToString().Length

Write-Output "There are total $data_count samples."

$scriptContent |
ForEach-Object -Begin { $curIndex = 1; } -Process {
    if ( $_ -match $line_pattern) {
        $wavNewName = $curIndex.ToString($file_fomratter);
        $sourcePath = Join-Path -Path $wavSource -ChildPath "$($Matches.file_name).wav";
        $targetPath = Join-Path -Path $wavTarget -ChildPath "$wavNewName.wav";
        New-Item -ItemType File -Path $targetPath -Force | Out-Null;
        Copy-Item -Path $sourcePath -Destination $targetPath;
        Add-Content -Path $targetScript -Value "$wavNewName`t$($Matches.content)";
    } else {
      Write-Output "Cannot process the $curIndex th item.";
    };
    $curIndex++;
};

$outputWavZipPath = Join-Path -Path $wavTarget -ChildPath '../wav.zip';

Write-Output "Produce resulting zip file..."
Compress-Archive -Force -Path "$(Join-Path -Path $wavTarget -ChildPath '*.wav')" -DestinationPath $outputWavZipPath;

Write-Output "Output script file is $(Resolve-Path $targetScript)"
Write-Output "Output wav file path is $(Resolve-Path $outputWavZipPath)`r`nDone."
