#!/bin/sh

# set timezone
apt-get update
apt-get install -y tzdata

# Setup user
useradd -ms /bin/bash bazel
