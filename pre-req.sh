#!/bin/bash

# Function to prompt the user and capture input with a timeout
function read_with_timeout {
    timeout=$1
    prompt="$2"
    read -t $timeout -r -p "$prompt" response
    echo "$response"
}

# Prompt the user with a 10-second timeout
response=$(read_with_timeout 10 "Should we proceed with checking Pre-requisite for Azure Event Grid? Type 'yes' or 'no' and press Enter: ")

# Check the user's response
if [[ "$response" == "yes" || "$response" == "y" ]]; then
    echo "Proceeding with checking prerequisites..."
    python3 pre-req.py  # Replace with the actual Python script you want to run
elif [[ "$response" == "no" || "$response" == "n" ]]; then
    echo "No selected. Exiting."
else
    echo "Invalid input. Please enter 'yes' or 'no'."
fi
