#!/bin/sh

# install curl for fetching bazel, git for fetching code
apt-get install -y curl git
# install prerequisites of bazel
apt-get install -y pkg-config zip g++ zlib1g-dev unzip

echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | apt-key add -

apt-get update
apt-get install -y bazel
