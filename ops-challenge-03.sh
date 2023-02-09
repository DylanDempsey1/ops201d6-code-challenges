#!/bin/bash

# Dylan Dempsey
# 02/08/23
#
# Print login History

# Main

print_history()
local dylan=$1
local history_file="$HOME/.bash_history

if [ -e "$history_file" ]; then
echo "Login history for dylan '$user':"
cat "$history_file"
else
echo "no login history found for user '$dylan'."
fi

#End