#!/bin/sh

# Get Flyway version from read
echo "Type in flyway version to install"
read flyway_version

# Create Variables from flyway version
flyway_file=flyway-commandline-$flyway_version-linux-x64.tar.gz
flyway_link=https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$flyway_version/$flyway_file

# Download new flyway version
cd ~/downloads
wget $flyway_link

# Extract tar.gz
tar -xzf $flyway_file

# Cleanup: Remove tar.gz
rm $flyway_file

# Create symbolic link from downloads to bin
sudo ln -s ~/downloads/flyway-$flyway_version/flyway /usr/local/bin 

# Create symbolic link to sql files in home folder
cd flyway-$flyway_version
rm -r sql
ln -s ~/sql ~/downloads/flyway-$flyway_version/sql

# Print new flyway version
flyway -v
