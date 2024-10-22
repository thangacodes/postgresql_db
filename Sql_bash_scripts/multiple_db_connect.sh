#!/bin/bash

echo "Color coding for a shell script..."

# Function to print green text
green() {
    echo -e "\e[1;32mThis text is green\e[0m"
}

# Function to print yellow text
red() {
    echo -e "\e[1;31mThis text is yellow\e[0m"
}

# Execute color functions
green
red

# Print execution timestamp
echo "green() Script executed at: $(date '+%Y-%m-%d %H:%M:%S')"
echo "You are working with app-service root-user to connect to src (OR) dest databases. Please select based on your needs."

# Variables
src_db="app1.ap-south-1.rds.amazonaws.com"
port="5432"
dest_db="app2.ap-south-1.rds.amazonaws.com"
username="dbadmin postgres"

# Function to connect to the source database
connect_src() {
    echo "green() Connecting to the source database $src_db"
    psql -h "$src_db" -p "$port" -U "$username"
}

# Function to connect to the destination database
connect_dest() {
    echo "green() Connecting to the destination database $dest_db"
    psql -h "$dest_db" -p "$port" -U "$username"
}

# Prompt user for input
echo "green() Which database do you want to connect to? (src/dest)"
read -r db_choice

# Print the selected database choice
echo "green() You have selected db choice as: $db_choice and the db endpoint to connect is: $dest_db"

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
