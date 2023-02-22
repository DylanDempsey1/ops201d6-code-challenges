# Ops 201 Code Challenge 12
# Dylan Dempsey
# 02/21/23
# Write a script Write a Powershell script that returns the IPv4 address of the computer.

# Main 

$outputFile = "network_report.txt"

# Execute the ipconfig /all command and save the output to the output file
ipconfig /all > $outputFile

# Define a function to extract the IPv4 address from a string
function Get-IPv4Address($inputString) {
    $regex = '\b(?:\d{1,3}\.){3}\d{1,3}\b' 
    $matches = Select-String -InputObject $inputString -Pattern $regex -AllMatches
    $ipAddresses = $matches.Matches.Value
    return $ipAddresses
}

# Read the contents of the output file and extract the IPv4 address
$fileContents = Get-Content $outputFile
$ipv4Addresses = Get-IPv4Address $fileContents

# Outout the IPv4 addresses to the console
$ipv4Addresses

# End

#ChatGPT was referenced for this code