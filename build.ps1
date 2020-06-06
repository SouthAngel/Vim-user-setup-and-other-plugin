# Download the source form https://github.com/vim/vim to .\vim_rp
# Need mingw64(GCC, mingw32-make, sed) python27-64 python38-64

$MGPath = "D:\msys64\mingw64\bin"
$MSPath = "D:\msys64\usr\bin"
$PY2Path = "D:\Python\Python27"
$PY3Path = "D:\Python\Python38"

$PY2V = ($PY2Path -split "ython")[-1]
$PY3V = ($PY3Path -split "ython")[-1]
$env:PATH = "$PY2Path;$PY3Path;$MGPath;$MSPath;$env:PATH"
# Set-Location .\vim_rp\src
# Compile
# mingw32-make -f Make_ming.mak GUI=yes gvim.exe&&
$srcDir = ".\vim_rp\src"
$constCmds = @("-f", "Make_ming.mak", `
    "PYTHON=$PY2Path", "DYNAMIC_PYTHON=yes", "PYTHON_VER=$PY2V", "DYNAMIC_PYTHON_DLL=python$PY3V.dll", `
    "PYTHON3=$PY3Path", "DYNAMIC_PYTHON3=yes", "PYTHON_VER=$PY3V", "DYNAMIC_PYTHON_DLL=python$PY3V.dll")
$cmdas = $constCmds + @("GUI=yes", "gvim.exe")
Write-Output ($cmdas -join " ")
Start-Process "mingw32-make" $cmdas -Wait -NoNewWindow -WorkingDirectory $srcDir
$cmdas = $constCmds + @("GUI=no", "vim.exe")
Write-Output ($cmdas -join " ")
Start-Process "mingw32-make" $cmdas -Wait -NoNewWindow -WorkingDirectory $srcDir
$files = Get-Item "$srcDir\*vim.exe"
$files += Get-Item ".\commands\*"
$files += Get-Item ".\vim_rp\runtime\*"
if (-not (Test-Path ".\runtime")){
    New-Item ".\runtime" -ItemType Directory
}
if ($files.count -gt 0){
    Copy-Item $files ".\runtime" -Force -Recurse
}

