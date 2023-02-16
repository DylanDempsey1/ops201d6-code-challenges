#!bin/bash/

# Ops 201d6 Code Challenge 09
# Dylan Dempsey
# 02/16/23
# Create a Powershell script that fetches useful System event logs.

# Main

# Set the path for the output files
$desktop = [Environment]::GetFolderPath("Desktop")
$last_24_path = Join-Path $desktop "last_24.txt"
$errors_path = Join-Path $desktop "errors.txt"

# Get all events from the System event log that occurred in the last 24 hours
$last_24_events = Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=(Get-Date).AddDays(-1)}
# Output the events to a file
$last_24_events | Out-File $last_24_path

# Get all "error" type events from the System event log
$error_events = Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; Id=6008,41}
# Output the events to a file
$error_events | Out-File $errors_path

# Print to the screen all events with ID of 16 from the System event log
Get-WinEvent -FilterHashtable @{LogName='System'; Id=16}

# Print to the screen the most recent 20 entries from the System event log
Get-WinEvent -FilterHashtable @{LogName='System'} -MaxEvents 20

# Print to the screen all sources of the 500 most recent entries in the System event log
Get-WinEvent -FilterHashtable @{LogName='System'} -MaxEvents 500 | Select-Object -Property ProviderName -Unique | Format-Table -Wrap
