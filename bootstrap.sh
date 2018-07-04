#!/bin/bash

echo "Updating..."
sudo apt-get update > /dev/null

sudo apt-get -y install make build-essential

sudo mkdir /opt/redis

cd /opt/redis
# Use latest stable
sudo wget -q http://download.redis.io/redis-stable.tar.gz
# Only update newer files
sudo tar -xz --keep-newer-files -f redis-stable.tar.gz

cd redis-stable
sudo make
sudo make install
sudo rm -rf /etc/redis.conf
sudo mkdir -p /etc/redis
sudo mkdir /var/redis
sudo chmod -R 777 /var/redis
sudo useradd redis

echo "Copying configs..."
sudo cp -u /vagrant/redis.conf /etc/redis/6379.conf

echo "Add service"
sudo ln -s /vagrant/redis.service /etc/systemd/system/redis.service
sudo service start redis
