#!/bin/bash

apt update
apt install python-pip -y
apt install unzip -y
pip install awscli

cp /home/ubuntu/.bashrc /home/ubuntu/.bashrc_orig

tee -a /home/ubuntu/.bashrc <<-'EOF'
complete -C '/usr/local/bin/aws_completer' aws
export PATH=/mnt/xvdf/node-v12.13.1-linux-x64/bin:$PATH
EOF

mkdir /mnt/xvdf
chown -Rf ubuntu:ubuntu /mnt/xvdf
mount /dev/xvdf /mnt/xvdf
echo /dev/xvdf  /mnt/xvdf ext4 defaults,nofail 0 2 >> /etc/fstab