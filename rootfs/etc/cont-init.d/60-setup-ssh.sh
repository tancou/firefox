#!/bin/sh

set -e

groupadd -g 3000 sshd
useradd -u 3000 -g 3000 -c sshd -d / sshd

echo -n "app:${APP_PASSWORD:=password}" | chpasswd
mkdir -p /home/app
mkdir -p /home/app/share
chown -R app:app /home/app
usermod -d /home/app app
chsh -s /bin/sh app

echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

ssh-keygen -A
