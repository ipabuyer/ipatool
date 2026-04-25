$ErrorActionPreference = "Stop"

$env:GOPROXY = "https://goproxy.cn,direct"
$env:GOSUMDB = "sum.golang.google.cn"
$env:GOOS = "windows"

try {
    $env:GOARCH = "amd64"
    go build -trimpath -ldflags="-s -w" -o ipatool-main-windows-amd64.exe
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    $env:GOARCH = "arm64"
    go build -trimpath -ldflags="-s -w" -o ipatool-main-windows-arm64.exe
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
finally {
    Remove-Item Env:\GOOS -ErrorAction SilentlyContinue
    Remove-Item Env:\GOARCH -ErrorAction SilentlyContinue
    Remove-Item Env:\GOPROXY -ErrorAction SilentlyContinue
    Remove-Item Env:\GOSUMDB -ErrorAction SilentlyContinue
}
