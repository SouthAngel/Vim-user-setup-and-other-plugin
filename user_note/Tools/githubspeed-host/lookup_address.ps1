function Get-IP ($address)
{
    $url = "https://www.ipaddress.com/search/$address"
    $ret = ""
    $web = New-Object Net.WebClient
    Write-Host "Download from - $url"
    $res = $web.DownloadString($url)
    if ($res -match "\d+\.\d+\.\d+\.\d+"){
        Write-Host "Match success"
        $ret = ($Matches[0] + " " + $address)
    }
    return $ret
}

$toWrite = @()
$toWrite += (Get-IP "github.com")
$toWrite += (Get-IP "assets-cdn.github.com")
$toWrite += (Get-IP "github.global.ssl.fastly.net")
$toWrite += (Get-IP "github-cloud.s3.amazonaws.com")
Write-Host ($toWrite -Join "`n")
Set-Content hosts.txt ($toWrite -Join "`n")
Set-Content hosts ($toWrite -Join "`n")
Pause
