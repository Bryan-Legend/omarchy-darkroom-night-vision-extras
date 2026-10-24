# Darkroom Night Vision - Windows installer
# Converts the Pillars of Creation wallpaper to PNG where the theme expects it,
# then applies the contrast theme.
$ErrorActionPreference = 'Stop'

$dir = Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\Themes\DarkroomNightVision'
New-Item -ItemType Directory -Force $dir | Out-Null

# The wallpaper ships as WebP; decode it with Windows' built-in WebP codec and
# save a PNG, which every Windows wallpaper path accepts.
Add-Type -AssemblyName PresentationCore
$in = [IO.File]::OpenRead((Join-Path $PSScriptRoot 'pillars-of-creation.webp'))
$out = [IO.File]::Create((Join-Path $dir 'pillars-of-creation.png'))
try {
    $decoder = [Windows.Media.Imaging.BitmapDecoder]::Create($in, 'None', 'OnLoad')
    $encoder = New-Object Windows.Media.Imaging.PngBitmapEncoder
    $encoder.Frames.Add($decoder.Frames[0])
    $encoder.Save($out)
} finally {
    $out.Close()
    $in.Close()
}

Invoke-Item (Join-Path $PSScriptRoot 'darkroom-night-vision.theme')
