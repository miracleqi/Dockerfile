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
没有得到Oracle认证，因此下载得到的文件，其实是一个提示认证失败的html文件
