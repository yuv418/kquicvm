#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./start.sh vm-name'
    exit
fi

# https://stackoverflow.com/questions/5608112/escape-filenames-the-same-way-bash-does-it
fname="img/$(printf '%q' "$1").img"

if [ -f $fname ]; then
    echo "vm at $fname already exists"
    exit
fi

cp img/ubuntu-noble.img $fname

# set up cloud init
# https://docs.cloud-init.io/en/latest/howto/launch_qemu.html#
echo "Creating cloud init seed image"
cd cloud-init

# Generate metadata
echo "instance-id: $(uuidgen || echo i-abcdefg)" > meta-data
genisoimage \
    -output seed.img \
    -volid cidata -rational-rock -joliet \
    user-data meta-data network-config
# go back
cd ..

./run-vm.sh $fname
