# Script: RDP Brute Force Detection with Geolocation
# This script tracks failed RDP login attempts, retrieves geolocation data using ipgeolocation.io API,
# and sends the logs to Azure Sentinel.

$ApiKey = "your_ipgeolocation_api_key"
$LogFile = "C:\path\to\logfile.txt"

# Get failed RDP login attempts from Event Log
$FailedRdpLogins = Get-WinEvent -LogName Security | Where-Object {$_.Id -eq 4625}

# Process each failed login attempt
foreach ($login in $FailedRdpLogins) {
    $IpAddress = $login.Properties[18].Value

    # Get geolocation data
    $GeoData = Invoke-RestMethod -Uri "https://api.ipgeolocation.io/ipgeo?apiKey=$ApiKey&ip=$IpAddress"
    $Location = $GeoData.country_name

    # Log the data
    $logMessage = "Failed RDP attempt from IP: $IpAddress, Location: $Location, Date: $(Get-Date)"
    Add-Content -Path $LogFile -Value $logMessage

    # Send log data to Azure Sentinel (replace with your actual Sentinel integration code)
    # Example: Send-LogToSentinel -LogMessage $logMessage
}
