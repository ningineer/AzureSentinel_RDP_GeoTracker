# Windows EventLog: Failed RDP Logins Source IP to GeoData Conversion for Azure Sentinel

# Define your API endpoint for GeoData (ipstack for this example)
$apiKey = "your_api_key_here"
$geoAPIUrl = "http://api.ipstack.com/{0}?access_key=$apiKey"

# Fetch failed RDP login events (Event ID 4625)
$failedRDPLogins = Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4625 }

# Process each failed login attempt
foreach ($event in $failedRDPLogins) {
    # Extract the IP address from the event details
    $ipAddress = ($event.Message -split " ") | Where-Object { $_ -match "^\d{1,3}(\.\d{1,3}){3}$" } | Select-Object -First 1

    if ($ipAddress) {
        # Fetch GeoData for the IP address using the GeoAPI
        $geoData = Invoke-RestMethod -Uri ($geoAPIUrl -f $ipAddress)

        # Extract relevant information
        $country = $geoData.country_name
        $region = $geoData.region_name
        $city = $geoData.city

        # Output the result (could be written to a CSV file or sent to Azure Sentinel)
        $output = "IP: $ipAddress, Country: $country, Region: $region, City: $city"
        Write-Output $output

        # You can use a logging mechanism to send the data to Azure Sentinel (optional)
        # Example: Send to Sentinel (example placeholder)
        # Send-AzureSentinelAlert -AlertType "RDP Brute Force" -Details $output
    }
}
