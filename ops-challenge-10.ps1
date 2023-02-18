# Ops 201d6 Lab 10
# Dylan Dempsey
# 02/17/23
# Create a Powershell script that Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
# Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
# Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
# Start the process Internet Explorer (iexplore.exe) and have it open https://owasp.org/www-project-top-ten/.
# Start the process Internet Explorer (iexplore.exe) ten times using a for loop. Have each instance open https://owasp.org/www-project-top-ten/.
# Close all Internet Explorer windows.
# Kill a process by its Process Identification Number. Choose a process whose termination won’t destabilize the system, such as Internet Explorer or MS Edge.

# Main 

#Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
Get-Process | Sort-Object CPU -Descending | Format-Table Name, CPU -AutoSize

#Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
Get-Process | Sort-Object ID -Descending | Format-Table Name, ID -AutoSize

#Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5 | Format-Table Name, WorkingSet -AutoSize

#Start the process Internet Explorer (iexplore.exe) and have it open https://owasp.org/www-project-top-ten/.
Start-Process iexplore.exe "https://owasp.org/www-project-top-ten/"

#Start the process Internet Explorer (iexplore.exe) ten times using a for loop. Have each instance open https://owasp.org/www-project-top-ten/.
for ($i=1; $i -le 10; $i++) {
Start-Process iexplore.exe "https://owasp.org/www-project-top-ten/"
}

#Close all Internet Explorer windows.
Get-Process iexplore | Foreach-Object { $_.CloseMainWindow() }

#Kill a process by its Process Identification Number. Choose a process whose termination won’t destabilize the system, such as Internet Explorer or MS Edge.
Stop-Process -Id [Process ID]

#ChatGPT was referenced for this code!!!!!!!!

# End