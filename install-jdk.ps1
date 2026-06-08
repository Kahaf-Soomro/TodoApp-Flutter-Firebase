$url = 'https://github.com/adoptium/temurin21-binaries/releases/latest/download/OpenJDK21U-jdk_x64_windows_hotspot_latest.zip'
$zipPath = 'D:\OpenJDK21.zip'
$installDir = 'D:\jdk'

if (-not (Test-Path 'D:\')) {
    Write-Error 'Drive D: not found.'
    exit 1
}

Write-Host "Downloading JDK from $url"
Invoke-WebRequest -Uri $url -OutFile $zipPath -UseBasicParsing

if (Test-Path $installDir) {
    Write-Host "Removing existing install dir $installDir"
    Remove-Item $installDir -Recurse -Force
}

Write-Host "Extracting JDK to $installDir"
Expand-Archive -Path $zipPath -DestinationPath $installDir -Force
Remove-Item $zipPath
Write-Host "JDK installed to $installDir"
Write-Host "Contents:"
Get-ChildItem $installDir | Select-Object -First 20 | ForEach-Object { Write-Host $_.FullName }
