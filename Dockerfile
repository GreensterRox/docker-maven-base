FROM centos:centos7
MAINTAINER GreensterRox

ENV JDK_VERSION 1.8.0
ENV MVN_VERSION 3.2.5

RUN yum -y update
RUN yum install -y wget
RUN yum -y install tar java-$JDK_VERSION-openjdk && rm -rf /var/cache/yum

# Could not get this way working so reverted to below maven install method
#WORKDIR /opt
#RUN curl --silent http://www.eu.apache.org/dist/maven/maven-3/$MVN_VERSION/binaries/apache-maven-$MVN_VERSION-bin.tar.gz | tar xvz
#RUN ln -s $(pwd)/apache-maven-$MVN_VERSION/bin/mvn /usr/bin/mvn

# Install Maven in 2 steps
RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
RUN yum install -y apache-maven

# Install Oracle JDBC
ADD assets/ojdbc6.jar /opt/ojdbc6.jar
RUN mvn install:install-file -Dfile=/opt/ojdbc6.jar -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0 -Dpackaging=jar

WORKDIR /opt

ENTRYPOINT []
CMD []