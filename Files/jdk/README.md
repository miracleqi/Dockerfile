由于jdk使用wget下载过于缓慢，因此已上传docker镜像  
docker pull m290557551/jdk:1.8.0_111-x64

Problems  
1. tar -zxvf jdk-8u111-linux-x64.tar.gz失败  
报错如下：  
&emsp;&emsp;gzip: stdin: not in gzip format  
&emsp;&emsp;tar: Child returned status 1  
&emsp;&emsp;tar: Error is not recoverable: exiting now  

原因在于使用下面方法下载时  
wget http://http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz  
因为Oracle官网下载jdk，需要点击accept licence才能下载  
因此下载得到的文件，其实是一个提示认证失败的html文件

2."source /etc/profile.d/java" does't work  
RUN source /etc/profile.d/java 提示/bin/sh: 1: source: not found  
这是因为默认RUN后的命令是在/bin/sh下执行，像Ubuntu默认/bin/sh是指向/bin/dash（dash没有source命令）  
如果想使用/bin/bash，则可按如下方式  
RUN ["/bin/bash","-c","source /etc/profile.d/java"]  
但此时发现，没有报错，但命令并不生效  
解决方法：RUN echo "source /etc/profile.d/java" >> /root/.bashrc  
/etc/profile与.bashrc的区别可参考http://www.linuxidc.com/Linux/2011-04/34448.htm
