####################################################
# Dockerfile to build jdk container images
# Based on jessie
####################################################

#Set the base image to jessie
FROM debian:jessie
    
#File Author
MAINTAINER Miracle
    
#make,c++ packages
RUN echo "deb http://mirrors.163.com/debian/ jessie main" > /etc/apt/sources.list \
    && echo "deb http://mirrors.163.com/debian/ jessie-updates main" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.163.com/debian-security/ jessie/updates main" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.163.com/debian/ jessie-backports main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y wget git sudo net-tools vim \
    && apt-get install make gcc automake autoconf libtool g++  -y 
    
#install jdk http://blog.csdn.net/rchm8519/article/details/48721913
RUN cd /usr \
    && mkdir java \
    && cd java \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz \
    && tar -zxvf jdk-8u111-linux-x64.tar.gz
    
#set ENV
RUN ln -s /usr/java/jdk1.8.0_111/ /usr/jdk \
    && echo "JAVA_HOME=/usr/jdk" >> /etc/profile.d/java \
    && echo "CLASSPATH=\$JAVA_HOME/lib/" >> /etc/profile.d/java \
    && echo "PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile.d/java \
    && echo "export PATH JAVA_HOME CLASSPATH" >> /etc/profile.d/java \
    && echo "source /etc/profile.d/java" >> /root/.bashrc 
    
#sshd
RUN apt-get install openssh-server -y --fix-missing	\
    && sed -i "s/^PermitRootLogin.*/PermitRootLogin yes/" /etc/ssh/sshd_config \
    && echo "root:root" | chpasswd \
    && mkdir /var/run/sshd
EXPOSE 22 
    
CMD ["/usr/sbin/sshd", "-D"]
