#!/bin/bash

# Function to display a notification (if available)
send_notification() {
    if command -v notify-send &>/dev/null; then
        notify-send "Countdown Timer" "$1"
    fi
}

# Function for the countdown timer
countdown_timer() {
    local duration="$1" # Duration in seconds

    while [ "$duration" -gt 0 ]; do
        echo -ne "Time remaining: $duration seconds\033[0K\r"
        sleep 1
        duration=$((duration - 1))
    done

    echo -ne "Time's up!\n"
    send_notification "Time's up!"
}

# Main
read -p "Enter duration in seconds: " time_seconds

if [[ $time_seconds =~ ^[0-9]+$ ]]; then
    countdown_timer "$time_seconds"
else
    echo "Invalid input. Please enter a valid duration in seconds."
fi

