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
  echo "export JAVA_HOME-/opt/jdk$JAVA_VERSION" >> /root/.bashrc

ENV JAVA_HOME /opt/jdk$JAVA_VERSION
