#!/bin/bash

apt update
apt install python-pip -y
apt install unzip -y
pip install awscli

cp /home/ubuntu/.bashrc /home/ubuntu/.bashrc_orig

tee -a /home/ubuntu/.bashrc <<-'EOF'
complete -C '/usr/local/bin/aws_completer' aws
export PATH=/opt/node-v12.13.1-linux-x64/bin:$PATH
EOF

apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
apt update
apt install docker-ce=18.06.3~ce~3-0~ubuntu -y
usermod -aG docker ubuntu

cd /opt
wget https://nodejs.org/dist/v12.13.1/node-v12.13.1-linux-x64.tar.xz

tar xvf node-v12.13.1-linux-x64.tar.xz
chown -Rf ubuntu:ubuntu node-v12.13.1-linux-x64/

git clone https://github.com/wubigo/node-fn.git /opt/node-fn
chown -Rf ubuntu:ubuntu /opt/node-fn
cd /opt/node-fn/sitemap
export PATH=/opt/node-v12.13.1-linux-x64/bin:$PATH


sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
npm install
node apify.js > apify.log
