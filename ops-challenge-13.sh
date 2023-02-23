#!bin/bash/

# Ops 201 Code Challenge 13
# Dylan Dempsey
# 02/22/23
# 

# Define the whois_lookup function
function whois_lookup() {
    # Get user input
    read -p "Enter a domain name: " domain

    # Run whois
    whois $domain > $domain.txt

    # Run dig
    dig $domain >> $domain.txt

    # Run host
    host $domain >> $domain.txt

    # Run nslookup
    nslookup $domain >> $domain.txt

    # Open the text file with the default text editor
    xdg-open $domain.txt
}

# Define the main function
function main() {
    echo "Welcome to my script!"
    # ... other options here ...

    # Option 6: run the whois_lookup function
    if [[ $option == "6" ]]; then
        whois_lookup
    fi
}

# Call the main function
main
