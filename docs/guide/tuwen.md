## 说明
* 基础教程只适合小白用户快速上手
* 务必每一步都和下面的操作一样

## 安装Anaconda。
* Anaconda 安装包可以到[TUNA](https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/)下载。
* 就下载最新的 https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2024.10-1-Windows-x86_64.exe
* 安装

## 安装依赖
* 打开`Anaconda Powershell Prompt`后执行
```
python -m pip install airtest_mobileauto --upgrade
```
![](/wzry.doc/fig/anaconda_powershell_prompt.png)
![](/wzry.doc/fig/anaconda_powershell_prompt2.png)

## 下载
* 从Releases页面下载最新的[Source code (zip)](https://github.com/cndaqiang/WZRY/releases)。
* 解压到`WZRY-x.x.x`(x.x.x为版本号)。本次演示版本为`WZRY-2.2.0`

![](/wzry.doc/fig/wzry.png)


## 更新资源
* 这个[网址](/wzry.doc/guide/upfig/)如果提示你需要更新，就下载更新
* **如果没有提示，千万不要更新**,活动结束后，及时删除`WZRY.图片更新.txt`

2024-10-30今天王者的周年庆活动仍在继续，所以需要更新，下载更新包1017.1211.zip,并解压到程序目录
![](/wzry.doc/fig/update.png)


## 安装雷电模拟器
* **确保你的电脑上没有其他模拟器在运行**
* **全新安装雷电模拟器并打开**，并设置分辨率,dpi,并开启ADB调试, **参数必须和图片中一致**。
![](/wzry.doc/fig/LDplayer.png)


## 安装王者荣耀APP到雷电模拟器
* 安装王者荣耀APP
* 更新游戏
* 登录账号
* **手动进入大厅，关闭活动提示**

## 运行wzry.py
* **确保你的电脑只有雷电模拟器这一个安卓模拟器在运行**
* **确保已安装游戏并进入大厅**
* **确保模拟器的分辨率是960x540,dpi=160,开启了ADB**

* 打开`Anaconda Powershell Prompt`后执行
```
cd D:\Download\WZRY-2.2.0
python -u wzry.py
```
![](/wzry.doc/fig/wzry.ld.png)

* 如果最后没有连接成功，请再次按照本流程重新做一遍。
* **务必使用anaconda, 并设置好模拟器**