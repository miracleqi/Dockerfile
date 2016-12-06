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
    && tar -zxvf jdk-8u111-linux-x64.tar.gz \
    && ln -s /usr/java/jdk1.8.0_111/ /usr/jdk \
    && echo "JAVA_HOME=/usr/jdk" >> /etc/profile.d/java \
    && echo "CLASSPATH=$JAVA_HOME/lib/" >> /etc/profile.d/java \
    && echo "PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile.d/java \
    && echo "export PATH JAVA_HOME CLASSPATH" >> /etc/profile.d/java \
    && source /etc/profile.d/java
    
#不能用以下方式下载
#wget -c http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz
#因为Oracle官网下载jdk，需要点击accept licence才能下载，否则通过cat可以看到，下载的文件是一个提示认证失败的html页面
#但即使用了上面的方法，下载也很慢，且并非100%能成功

RUN apt-get install openssh-server -y --fix-missing	

RUN sed -i "s/^PermitRootLogin.*/PermitRootLogin yes/" /etc/ssh/sshd_config
    
# 添加测试用户admin，密码admin，并且将此用户添加到sudoers里 
RUN useradd admin \
    && echo "root:root" | chpasswd  \
    && echo "admin:admin" | chpasswd  \
    && echo "admin   ALL=(ALL)       ALL" >> /etc/sudoers  
    
# 启动sshd服务并且暴露22端口 
RUN mkdir /var/run/sshd  
EXPOSE 22 

CMD ["/usr/sbin/sshd", "-D"]
