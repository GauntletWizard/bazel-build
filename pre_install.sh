#!/bin/sh

# change sources to mirror in China
mv /etc/apt/sources.list /etc/apt/sources.list.save
mv sources.list /etc/apt/sources.list

# set timezone
apt-get update
apt-get install -y tzdata
echo Asia/Shanghai > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
