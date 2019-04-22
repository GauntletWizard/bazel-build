FROM ubuntu:18.04
MAINTAINER Ted Hahn <thahn@tcbtech.com>

ADD pre_install.sh /root/
ADD install_java.sh /root/
ADD install_bazel.sh /root/
ADD install_python.sh /root/
ADD install_golang.sh /root/


# install bazel and it's dependencies
RUN cd /root \
  && ./pre_install.sh && rm pre_install.sh \
  && ./install_java.sh && rm install_java.sh \
  && ./install_bazel.sh && rm install_bazel.sh \
  && ./install_python.sh && rm install_python.sh \
  && ./install_golang.sh && rm install_golang.sh
RUN apt-get install -y docker.io

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

WORKDIR /root

CMD ["/bin/bash"]
