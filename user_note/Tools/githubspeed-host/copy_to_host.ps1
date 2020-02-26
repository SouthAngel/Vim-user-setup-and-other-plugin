Copy-Item host $env:SYSTEMROOT\System32\drivers\etc\host -Force
ipconfig /flushdns
Pause
