#!/bin/sh

echo "Type in flyway version to install"
read flyway_version

flyway_file=flyway-commandline-$flyway_version-linux-x64.tar.gz
echo $flyway_file

flyway_link=https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$flyway_version/$flyway_file

cd ~/downloads
wget $flyway_link
tar -xzf $flyway_file
rm $flyway_file
sudo ln -s ~/downloads/flyway-$flyway_version/flyway /usr/local/bin 
cd flyway-$flyway_version
rm -r sql
ln -s ~/sql ~/downloads/flyway-$flyway_version/sql

