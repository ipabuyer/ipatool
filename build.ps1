$ErrorActionPreference = "Stop"

$env:GOPROXY = "https://goproxy.cn,direct"
$env:GOSUMDB = "sum.golang.google.cn"

$env:GOOS = "windows"
$env:GOARCH = "amd64"
go build -o ipatool-main-windows-amd64.exe

$env:GOOS = "windows"
$env:GOARCH = "arm64"
go build -o ipatool-main-windows-arm64.exe

Remove-Item Env:\GOOS -ErrorAction SilentlyContinue
Remove-Item Env:\GOARCH -ErrorAction SilentlyContinue
Remove-Item Env:\GOPROXY -ErrorAction SilentlyContinue
Remove-Item Env:\GOSUMDB -ErrorAction SilentlyContinue