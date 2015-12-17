# 初次体验 openresty 的安装

## 简介

这是我第一次接触 openresty 并安装它，写这篇文章的目的就是记录下安装 openresty 的过程与经验。我的操作系统是 Ubuntu 14.04 server 。

## 下载安装 openresty

在 openresty 的 [官方网站](http://openresty.org/) 上能够下载到它的安装包。

在安装之前，需要先安装一些 openresty 依赖的库：

- libreadline-dev
- libncurses5-dev
- libpcre3-dev
- libssl-dev
- perl
- make
- build-essential

这些库都可以使用 apt-get 进行安装，非常方便。依赖库都安装好了之后，就可以开始安装 openresty 了。

使用 tar zxvf ngx_openresty-1.9.3.1 解压缩安装包，然后进入到解压好的文件夹中，可以看到有一个 configure 的可执行文件。使用 ./configure --help 能够查看它的帮助文档，这个可执行文件是用来配置 openresty 的安装参数的。文档中有很多参数，我就不一一列举了，因为我也不太懂这些参数，后面会把这块内容补上。

配置好了安装参数后，就可以使用 make 和 make install 命令进行安装了。

## 遇到的问题
在安装时，需要使用管理员权限进行安装，于是我切换到了 root ，然后调用 configure 配置安装路径。在填写路径的时候我使用的 ~/openresty ，我的本意是安装到自己 home 目录下的文件夹中，结果由于当时是 root 身份，所以安装路径并不是我想要的。所以当我执行完 make install 后，会找不到安装后的文件，就是因为路径不对。

在配置时使用绝对路径就不会有这样的问题了。





