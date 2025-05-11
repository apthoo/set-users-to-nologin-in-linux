#!/bin/bash

# Enter the usernames to set as /usr/sbin/nologin
# -a to read into an array
read -p "Enter the user names (space separated): " -a names  

# Display the usernames
echo "User names are:"
echo "${names[@]}"

# Loop check if users exist in /etc/passwd or not
for user in "${names[@]}"; do
    if grep -q "^$user:" /etc/passwd; then
        echo "$user found and updating shell to nologin..."
        sudo usermod -s /usr/sbin/nologin "$user"
        echo "$user updated to 'nologin'"
    else
        echo "User $user not found."
    fi
done
