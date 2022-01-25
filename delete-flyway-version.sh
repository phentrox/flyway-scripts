#!/bin/sh

echo "Type in flyway version to delete"
read flyway_version

flyway_dir=~/downloads/flyway-${flyway_version}

if [ ! -d "$flyway_dir" ]
then
    echo "Flyway Dir does not exist!" 
else
    rm -rf ~/downloads/flyway-$flyway_version
    echo "Flyway Dir deleted! (if no error came up)"
fi

# delete old ln in bin
sudo rm /usr/local/bin/flyway
