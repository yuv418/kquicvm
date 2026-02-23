#!/bin/bash

# https://stackoverflow.com/questions/1371261/get-current-directory-or-folder-name-without-the-full-path
quicpath=$(dirname $(realpath $0))/quic

if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./run-vm.sh vm.img'
    exit
fi

# launch
qemu-system-x86_64                                            \
                                               -net nic                                                    \
                                               -net user                                                   \
                                               -machine accel=kvm:tcg                                      \
                                               -m 4096                                                      \
                                               -smp 4 \
                                               -nographic                                                  \
                                               -hda $1                        \
                                               -drive file=cloud-init/seed.img,index=1,media=cdrom \
                                               -fsdev local,security_model=mapped,id=fsdev0,path=$quicpath \
                                               -device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=quicshare
                                               #-smbios type=1,serial=ds='nocloud;s=http://10.0.2.2:8000/'


