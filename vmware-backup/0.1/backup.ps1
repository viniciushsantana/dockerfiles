<#
.SYNOPSIS Run PowerCLI script w/PowerCLI Core Docker Container and pass in parameters using Docker env variables
.NOTES  Author:  William Lam (modified)
.NOTES  Reference: http://www.virtuallyghetto.com/2016/10/5-different-ways-to-run-powercli-script-using-powercli-core-docker-container.html
#>

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false | Out-Null

$VI_SERVER = (Get-ChildItem ENV:VI_SERVER).Value
$VI_USERNAME = (Get-ChildItem ENV:VI_USERNAME).Value
$VI_PASSWORD = (Get-ChildItem ENV:VI_PASSWORD).Value

Write-Host "`nConnecting to vCenter Server/ESXi host..."
Connect-VIServer -Server $VI_SERVER -User $VI_USERNAME -password $VI_PASSWORD | Out-Null

Write-Host "Getting the backup ..."
Get-VMHostFirmware -VMHost $VI_SERVER -BackupConfiguration -DestinationPath /app | Out-Null

Write-Host "Disconnecting ...`n"
Disconnect-VIServer * -Confirm:$false
