#
# jpodeszwik/rpi-java Dockerfile
#
 
FROM sdhibit/rpi-raspbian 

# Install prerequisites
RUN \
  apt-get update && \
  apt-get install -y wget ca-certificates

ENV JAVA_VERSION 1.8.0_06
ENV JAVA_DOWNLOADED_FILENAME jdk-8u6-linux-arm-vfp-hflt.tar.gz
RUN \
  wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u6-b23/$JAVA_DOWNLOADED_FILENAME && \
  tar -xvzf $JAVA_DOWNLOADED_FILENAME && \
  rm $JAVA_DOWNLOADED_FILENAME && \
  mv jdk$JAVA_VERSION /opt && \
  echo "export PATH=$PATH:/opt/jdk$JAVA_VERSION/bin" >> /root/.bashrc && \
  echo "export JAVA_HOME=/opt/jdk$JAVA_VERSION" >> /root/.bashrc && \
  echo "PATH=/bin:/usr/bin:/opt/jdk$JAVA_VERSION/bin" >> /etc/environment && \
  echo "JAVA_HOME=/opt/jdk$JAVA_VERSION" >> /etc/environment

ENV JAVA_HOME /opt/jdk$JAVA_VERSION
