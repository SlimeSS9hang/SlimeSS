$ErrorActionPreference = 'Stop'

$packageName = 'slimess'
$url64      = 'https://github.com/SlimeSS9hang/SlimeSS/releases/download/v1.1.0/SlimeSS-Setup-1.1.exe'
$checksum64 = '89DC3A6C40D1FEDD94A53717448F6DCE2B329184D1199036972462BB29040133'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
