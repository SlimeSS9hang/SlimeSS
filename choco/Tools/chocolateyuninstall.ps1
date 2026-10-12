$ErrorActionPreference = 'Stop'

$packageName = 'slimess'
$softwareName = 'SlimeSS*'

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    $packageArgs = @{
      packageName    = $packageName
      fileType       = 'exe'
      silentArgs     = '/S'
      file           = "$($_.UninstallString)"
      validExitCodes = @(0)
    }
    Uninstall-ChocolateyPackage @packageArgs
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "Multiple matches found for $softwareName. Uninstall manually."
}
