FROM ubuntu:18.04
MAINTAINER Ted Hahn <thahn@tcbtech.com>

# Invocation: docker build --squash . -t gauntletwizard/bazel-go:bazel

# install bazel and it's dependencies
ADD pre_install.sh /root/
RUN cd /root && ./pre_install.sh && rm pre_install.sh

ADD install_java.sh /root/
RUN cd /root && ./install_java.sh && rm install_java.sh

ADD install_golang.sh /root/
RUN cd /root && ./install_golang.sh && rm install_golang.sh

ADD install_bazel.sh /root/
RUN cd /root && ./install_bazel.sh && rm install_bazel.sh

ADD install_python.sh /root/
RUN cd /root && ./install_python.sh && rm install_python.sh

ADD install_kubectl.sh /root/
RUN cd /root && ./install_kubectl.sh && rm install_kubectl.sh

RUN apt-get install -y docker.io

ADD post_install.sh /root/
RUN cd /root && ./post_install.sh && rm post_install.sh

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

WORKDIR /home/bazel
USER bazel
