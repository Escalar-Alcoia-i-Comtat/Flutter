$ScriptsDir = $PSScriptRoot
$BuildScript = "$ScriptsDir/build.ps1"
$ProjectRoot = "$ScriptsDir/.."
$FlutterDir = "$ProjectRoot/eaic_flutter"

& "$BuildScript"

Copy-Item -Recurse -Force -Path "$FlutterDir/build/web/*" -Destination "$ProjectRoot/eaic_mobile"

firebase hosting:channel:deploy testing
