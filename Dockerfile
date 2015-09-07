#
# jpodeszwik/rpi-java Dockerfile
#
 
FROM sdhibit/rpi-raspbian 

# Install prerequisites
RUN \
  apt-get update && \
  apt-get install -y wget ca-certificates

ENV JAVA_VERSION 1.8.0_60
ENV JAVA_DOWNLOADED_FILENAME jdk-8u60-linux-arm32-vfp-hflt.tar.gz
RUN \
  wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/$JAVA_DOWNLOADED_FILENAME && \
  tar -xvzf $JAVA_DOWNLOADED_FILENAME && \
  rm $JAVA_DOWNLOADED_FILENAME && \
  mv jdk$JAVA_VERSION /opt && \
  ln -s /opt/jdk$JAVA_VERSION /opt/jdk

ENV JAVA_HOME /opt/jdk
ENV PATH $PATH:$JAVA_HOME/bin

# add environment variables for non root users
RUN \
  echo "JAVA_HOME=$JAVA_HOME" >> /etc/environment && \
  echo "PATH=$PATH" >> /etc/environment

