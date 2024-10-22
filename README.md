# Postgresql_db

This repository contains my Postgres database that I installed on my Mac OS X system.

Step 1: Install PostgreSQL with Homebrew
To install PostgreSQL using Homebrew, simply run the following command in your terminal:
brew install postgresql@15
This will download and install PostgreSQL along with its dependencies on your MacOS system.

Step 2: Start and Enable PostgreSQL Service
After installing PostgreSQL, you need to start and enable the PostgreSQL service. Run the following commands in your terminal:
brew services start postgresql@15

Step 3: Add PostgreSQL in PATH
Run sudo vi /etc/paths and add this path on new line.
/opt/homebrew/opt/postgresql@15/bin
Step 4: Create a New PostgreSQL User and Database
Start postgres in terminal
psql postgres
