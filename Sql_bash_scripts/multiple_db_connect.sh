#!/bin/bash
echo "Setting up color coding function..."

# Function to print green text
green() {
    echo -e "\e[1;32m$1\e[0m"
}

# Function to print red text
red() {
    echo -e "\e[1;31m$1\e[0m"
}

# Function to print yellow text
yellow() {
    echo -e "\e[1;33m$1\e[0m"
}

# Execute color functions
green "This text is green"
red "This text is red"
yellow "This text is yellow"

# Print execution timestamp
green "Script executed at: $(date '+%Y-%m-%d %H:%M:%S')"
yellow "You are working with app-service root-user to connect to src (OR) dest databases. Please select based on your needs."

# Variables
src_db="app1.ap-south-1.rds.amazonaws.com"
port="5432"
dest_db="app2.ap-south-1.rds.amazonaws.com"
username="dbadmin"

# Function to connect to the source database
connect_src() {
    green "Connecting to the source database $src_db"
    psql -h "$src_db" -p "$port" -U "$username"
}

# Function to connect to the destination database
connect_dest() {
    green "Connecting to the destination database $dest_db"
    psql -h "$dest_db" -p "$port" -U "$username"
}

# Prompt user for input
green "Which database do you want to connect to? (src/dest)"
read -r db_choice

# Print the selected database choice
green "You have selected db choice as: $db_choice and the db endpoint to connect is: $dest_db"

# Use case statement to handle user input
case $db_choice in
    src)
        connect_src
        ;;
    dest)
        connect_dest
        ;;
    *)
        red "Invalid choice. Please choose 'src' or 'dest'."
        ;;
esac
