$ScriptsDir = $PSScriptRoot
$FlutterDir = "$ScriptsDir/../eaic_flutter"

Set-Location "$FlutterDir"

flutter build web --web-renderer canvaskit --release
