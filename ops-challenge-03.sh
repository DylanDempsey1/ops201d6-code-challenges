#!/bin/bash

# Dylan Dempsey
# 02/08/23
#
# Print login History

# Main

last -n 200 

show_login_history() {
    local dylan=$1
    local num_logins=${2: -200}

    last -n $num_logins -x $dylan
}

#End