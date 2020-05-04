#!/bin/bash

# install Docker
sudo apt install docker-ce

# get the repositories
mkdir repositories
cd repositories
git clone https://github.com/drmpeg/gr-dvbs2.git
cd ..

# build the Docker image
docker build -t phase4 .

# add the system variable if it doesn't already exist
if ! grep -Fq 'PHASE4_DEV_DIR' ~/.bashrc
then
    echo "export PHASE4_DEV_DIR=$PWD" >> ~/.bashrc
    export PHASE4_DEV_DIR=$PWD
fi

# install the x11 docker program if not installed
if ! hash x11docker 2>/dev/null
then
    echo 'Not Found'
    curl -fsSL https://raw.githubusercontent.com/mviereck/x11docker/master/x11docker | sudo bash -s -- --update
fi
