kiwi源码阅读与注释
=====================

* 此分支下的代码是为了理解wiki工作原理做的注解，做非破坏性注解与代码修改，便于自己理解
* kiwi是一个linux系统镜像构建系统，可以制作自己的linux镜像
* 可以编写代码自动构建操作系统与应用，主要是想为项目和自己构建一个可以持续升级的操作系统
* 目的是想在使用kiwi构建操作系统时更加深入理解操作系统工作原理，作为自己深入学习的素材
* 最终可以通过点滴积累继续构建制作出各种满足项目和自己需要的操作系统与应用的封装镜像



KIWI
==================
```
（/'kiwi/n. [口]新西兰人；[鸟]几维（一种新西兰产的无翼鸟）；猕猴桃）
```

Introduction
------------
``
简介
```

The openSUSE KIWI Image System provides an operating
system image solution for Linux supported hardware platforms as
well as for virtualization systems like Xen, VMware, etc. 
```
openSuse KIWI镜像系统不仅为支持linux操作系统的硬件平台也为支持linux虚拟化的的系统，
比如Xen,VMware等提供了操作系统镜像解决方案
```

The KIWI architecture was designed as a two level system.
```
KIWI的架构被设计成二级系统，分成两个阶段
```

The first stage,based on a valid software package source, creates a so called 
unpacked image according to the provided image description.
```
第一个阶段，是根据提供的镜像描述基于合法的软件包源码构建称作是未打包的镜像
```

The second stage creates from a required unpacked image an
operating system image. 
```
第二个阶段是根据为解压的镜像创建操作系统镜像
```

The result of the second stage is called
a packed image or short an image.
```
第二阶段的结果称为打包镜像或者简称为镜像
```

Installation
------------
```
安装
```

packages for kiwi are provided at the openSUSE buildservice:
```
软件安装包已经在openSuse的构建服务上提供，下载地址如下
```
http://download.opensuse.org/repositories/Virtualization:/Appliances/

(注:我非常喜欢openSuse系统的两个服务 kiwi:镜像构建 buildservice:软件包构建，主要是可以通过代码自动化持续构建，这样可以慢慢积累，不断优化)

Usage
-----
```
用法
```


1. make sure you have the kiwi-templates package installed
```
确保你已经安装了kiwi-templates包
zypper -n install kiwi-templates
```
* 安装完成查看模板
```
kiwi --list
Jul-19 22:13:21 <1> : * rhel-05.4-JeOS
Jul-19 22:13:21 <1> : Version: 1.1.0                                                                                                                                                           done
Jul-19 22:13:21 <1> : * rhel-06.0-JeOS
Jul-19 22:13:21 <1> : Version: 1.1.0                                                                                                                                                           done
Jul-19 22:13:21 <1> : * suse-12.1-JeOS
Jul-19 22:13:21 <1> : Version: 1.12.1                                                                                                                                                          done
Jul-19 22:13:21 <1> : * suse-12.2-JeOS
Jul-19 22:13:22 <1> : Version: 1.12.2                                                                                                                                                          done
Jul-19 22:13:22 <1> : * suse-12.3-JeOS
Jul-19 22:13:22 <1> : Version: 1.12.3                                                                                                                                                          done
Jul-19 22:13:22 <1> : * suse-13.1-JeOS
Jul-19 22:13:22 <1> : Version: 1.13.1                                                                                                                                                          done
Jul-19 22:13:22 <1> : * suse-13.2-JeOS
Jul-19 22:13:22 <1> : Version: 1.13.2                                                                                                                                                          done
Jul-19 22:13:22 <1> : * suse-SLE10-JeOS
Jul-19 22:13:22 <1> : Version: 1.1.0                                                                                                                                                           done
Jul-19 22:13:22 <1> : * suse-SLE11-JeOS
Jul-19 22:13:22 <1> : Version: 1.11.3                                                                                                                                                          done
Jul-19 22:13:22 <1> : * suse-SLE12-JeOS
Jul-19 22:13:22 <1> : Version: 1.13.1        
```
2. build a live ISO example:
```
构建一个可以试用的光盘镜像
```

```
kiwi --build suse-XXX-JeOS -d /tmp/myimage --type iso
```
* 参数 --build
```
Image Creation in one step:
    kiwi -b | --build <image-path> -d <destination>
      [ --cache <dir> ]
```

* 参数 -d
```
Image Creation Options:
    [ -d | --destdir <destination-path> ]
      Specify destination directory to store the image file(s)
```
* 参数 --type
```
Image Creation Options:
[ -t | --type <image-type> ]
      Specify the output image type. The selected type must be
      part of the XML description
```

3. run your OS in a VM like kvm
```
通过虚拟机运行你的操作系统镜像，比如通过kvm
```

```
kvm -cdrom /tmp/myimage/*.iso
```

Mailing list
------------
开发组邮件列表订阅

*  http://groups.google.com/group/kiwi-images

Contributing
------------
```
向项目提交代码流程
```

1. Fork it. 在github fork代码到自己名下
2. Create a branch (`git checkout -b my_kiwi`) 创建特性分支
3. Commit your changes (`git commit -am "Added Snarkdown"`) 提交自己的代码
4. Push to the branch (`git push origin my_kiwi`) 推送到github自己名下仓库
5. Create an [Issue][1] with a link to your branch 在github的问题管理系统创建一个问题 连接到自己的特性分支
6. Enjoy a refreshing Diet Coke and wait 然后等待代码合并

also see the git-review gem 可以参考 git-review gem包的代码审核流程 

https://rubygems.org/gems/git-review
Manage review workflow for projects hosted on GitHub (using pull requests)
这个包是用来管理托管在githun上项目的代码审核流程的 使用pull request

Remember to have fun :)

准备工作
============
* openSuse 系统 (kiwi目前支持 opensuse readhat centos)(已经在opensuse的虚拟机自己从源码安装kiwi)
* perl书籍若干(kiwi主要是perl语言编写的)
* 学会了perl调试(代码量很大也很复杂，调试是必须的)
* make书籍若干(kiwi是通过make管理项目构建的 kiwi的makefile写的特别好 很规范 代码注释很好，学习的很好的范例)
* 时间与耐心
* 笔记总结 http://localhost:8080/wiki/index.php?title=Kiwi
* 源码注释（好记性不如烂笔头，以后是要反复看的，要不就白看了） https://github.com/gnuhub/kiwi/tree/gnuhub_kiwi
