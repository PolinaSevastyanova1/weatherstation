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
	cd "C:\Campbellsci\LoggerNet\data_collected"
	git remote set-url origin https://github.com/PolinaSevastyanova1/weatherstation.git
	git fetch origin main
	git add .	
	git commit -m "Hourly update"
	#git pull origin main -X ours --no-edit
	git push origin main

	Write-Host "Data pushed."


	Start-Sleep -Seconds 2
	netsh wlan disconnect
	Start-Sleep -Seconds 2
	} else {
	Write-Host "Could not connect to internet."
	Start-Sleep -Seconds 2
}
Write-Host "--Hourly Data Script Finished--"
Start-Sleep -Seconds 30

#This is the github token for the repo
#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 
