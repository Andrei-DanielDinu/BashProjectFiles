#!/bin/bash

# Function to generate a random password
generate_password() {
    password_length="$1"  # Password length

    if [[ ! "$password_length" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid password length (numeric value)."
        exit 1
    fi

    if [ "$password_length" -lt 8 ]; then
        echo "Password length should be at least 8 characters."
        exit 1
    fi

    # Generate password using /dev/urandom
    password=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c$password_length)
    
    echo "Generated password: $password"
}

# Main
read -p "Enter password length: " length
generate_password "$length"

