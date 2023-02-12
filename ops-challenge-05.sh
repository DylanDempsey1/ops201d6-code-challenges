#!/bin/bash

# Ops201d6-code-challenge-05
# Dylan Dempsey
# 02/12-23
# Write a script that displays running processes, asks the user for a PID, then kills the process with that PID while using a loop.

# Main 
while true; do
  clear
  echo "Running Processes:"
  ps -A

  echo
  echo "Enter PID to kill (0 to exit):"
  read PID

  if [ $PID -eq 0 ]; then
    break
  fi

  if ps -p $PID > /dev/null; then
    echo "Killing process $PID..."
    kill $PID
  else
    echo "Invalid PID: $PID"
  fi

  echo "Press enter to continue..."
  read
done

echo "Well that was fun!"

# End 

#ChatGPT assisted with the creation of this script

