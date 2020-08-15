FROM ringcentral/chrome-vnc:chrome75

ENV DISPLAY :99

# Prepare installation of Oracle Java 8
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install git, wget, Oracle Java8
RUN echo 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' >> /etc/apt/sources.list && \
    echo 'deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' >> /etc/apt/sources.list && \
    echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe' >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886 && \
    apt-get update && \
    apt-get install -y git wget && \
    echo oracle-java${JAVA_VER}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y --no-install-recommends oracle-java${JAVA_VER}-installer oracle-java${JAVA_VER}-set-default && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /var/cache/oracle-jdk${JAVA_VER}-installer

# Set Oracle Java as the default Java
RUN update-java-alternatives -s java-8-oracle
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/bash.bashrc

# Install maven
RUN wget --no-verbose -O /tmp/apache-maven-3.5.4-bin.tar.gz http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz && \
    tar xzf /tmp/apache-maven-3.5.4-bin.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-3.5.4 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin  && \
    rm -f /tmp/apache-maven-3.5.4-bin.tar.gz

ENV MAVEN_HOME /opt/maven

RUN apt-get update && apt-get -qqy --no-install-recommends install python2.7
RUN ln -s /usr/bin/python2.7 /bin/python
RUN wget https://bootstrap.pypa.io/get-pip.py && python2.7 get-pip.py && rm get-pip.py
RUN pip install compago

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init

ENV TZ 'Asia/Shanghai'
RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean
