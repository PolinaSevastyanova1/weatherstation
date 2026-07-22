Clear-Host
Write-Host "--Hourly Data Script Started--"

Write-Host "Turning on Wifi"
#Enable-NetAdapter -Name "WiFi" -Confirm:$false
Start-Sleep -Seconds 5
netsh wlan connect name="eduroam"
#Write-Host "Turning on eduroam"

Start-Sleep -Seconds 5
if (Test-Connection -ComputerName github.com -Count 1 -Quiet) {
	Write-Host "Connected to internet. Starting data push."

	$Data1="CR1000_1436_Folgefonna_Modem_Table1min.dat"
	$Data15="CR1000_1436_Folgefonna_Modem_Table15min.dat"
	$Attachments=@($Data1,$Data15)

	Start-Sleep -Seconds 2
	netsh wlan disconnect
	Start-Sleep -Seconds 2
	} else {
	Write-Host "Could not connect to internet."
	Start-Sleep -Seconds 2
}
Write-Host "--Hourly Data Script Finished--"
Start-Sleep -Seconds 2

