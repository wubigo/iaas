#!/bin/bash

apt update
apt install python-pip -y
apt install unzip -y
pip install awscli

# echo "Asia/Shanghai" > /etc/timezone
# unlink /etc/localtime
# ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# cp /home/ubuntu/.bashrc /home/ubuntu/.bashrc_orig

tee -a /home/ubuntu/.bashrc <<-'EOF'
complete -C '/usr/local/bin/aws_completer' aws
export PATH=/mnt/xvdf/node-v12.13.1-linux-x64/bin:/mnt/xvdf/bin/:$PATH
EOF


# tee -a /home/ubuntu/.terraformrc <<-'EOF'
# plugin_cache_dir   = "/mnt/xvdf/.terraform.d/plugin-cache"
# disable_checkpoint = true
# EOF

# mkdir /mnt/xvdf
# chown -Rf ubuntu:ubuntu /mnt/xvdf
# mount /dev/xvdf /mnt/xvdf
# echo /dev/xvdf  /mnt/xvdf ext4 defaults,nofail 0 2 >> /etc/fstab


# apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
# apt update
# apt install docker-ce=18.06.3~ce~3-0~ubuntu -y
# usermod -aG docker ubuntu