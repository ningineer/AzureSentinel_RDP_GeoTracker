# Sentinel-Lab Demo - RDP Brute Force Detection with Geolocation

This is a PowerShell script designed to track failed RDP login attempts, integrate with the **ipgeolocation.io** API to get geolocation data, and send logs to Azure Sentinel for monitoring and analysis.

## Features:
- Collects failed RDP login attempts from Windows Event Logs.
- Integrates with **ipgeolocation.io** API for geographical data of the attackers.
- Sends logs to **Azure Sentinel** for real-time monitoring.

## Setup Guide:

### Step 1: Set Up Azure Sentinel
1. Sign up for a free Azure account.
2. Create a **Log Analytics workspace**.
3. Enable **Azure Sentinel** for your workspace.

### Step 2: Modify PowerShell Script
1. Clone the repository.
2. Replace `API_KEY` in the script with your IP Geolocation API key.
3. Set up the script to pull RDP login event logs.

### Step 3: Set Up Data Collection
1. Configure Windows Event Log forwarding to Azure Sentinel.
2. Create a custom Analytics Rule in Sentinel to monitor failed login attempts.

### Step 4: Visualization
1. Create a **Power BI** dashboard or use **Azure Sentinel Workbooks** to visualize attack locations on a map.

## Requirements:
- **PowerShell**
- **ipgeolocation.io API Key**
- **Azure Subscription**
- **Azure Sentinel Workspace**

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
