# 只用一部手机、不依赖电脑运行自动化脚本

## 说明
* 该页面是介绍我的使用经验,不是教程
* 随着软件更新,这些经验可能不再适用
* 谨慎阅读
* **使用手机运行脚本的核心是在手机上安装一个debian系统, 来替换电脑**
* 手机版流程和电脑版流程的区别仅是手机版先安装一个debian系统
* adb连接、配对、配置脚本等其他操作和电脑版的教程没有区别.

## 你会遇到的问题?
**本经验的难度较高, 没有linux、adb基础的用户不要轻易尝试,**你可能会遇到很多问题

* 如何使用adb连接手机对于linux、adb新手可能有些难度, 且不同手机的操作流程不同
* 新款手机的分辨率可能不是`16:9`, 脚本并不是所有功能都能正常工作
* 不同手机系统的ui设计不同, 即使执行`adb`命令把手机的分辨率调整为 `960x540`了, 手机系统(比如miui)也会强制占用屏幕的一部分为通知栏/按键栏
* 因此即使调整了分辨率, 脚本的功能也未必能全部正常工作.



## 安装Debian
为什么要在termux中安装debian而不是直接使用termux?

* termux虽然也可以adb连接手机, 但是python的很多依赖都无法安装, 脚本不能正常工作
* termux中安装debian后就是完整的linux环境了, python无法安装的依赖可以apt等方式解决, 脚本可以正常运行.


安装流程

* [termux](https://github.com/termux/termux-app)
* [AnLinux-App](https://github.com/EXALAB/AnLinux-App)
* **开启科学网络环境**用于安装Debian和依赖
* 使用AnLinux安装**Debian**

![type:video](../fig/installdebian.mp4)




## 配置依赖
```
~ $ ./start-debian.sh
root@localhost:~# apt update
```
![ternux](../fig/termux2.png)

依次执行
```
apt install python3 python3-pip android-tools-adb python3-dev build-essential libatlas-base-dev vim
#pip安装的一些库不能用,适用apt替代
apt install python3-numpy python3-opencv libgl1-mesa-glx libgtk2.0-dev python3-pillow python3-psutil
#安装airtest-mobileauto
python3 -m pip install airtest-mobileauto
#卸载python装的依赖, 使用系统的依赖
python3 -m pip uninstall opencv-python opencv-contrib-python opencv-python-headless -y
```

## 配置WZRY
### 下载AutoWZRY
```
python3 -m pip download autowzry --no-deps
tar xzvf autowzry-2.2.9b3.tar.gz #这个最新版的名字可能会变, 适当调整为你下载到的文件名
cd autowzry-2.2.9b3/autowzry/
```
![ternux](../fig/termux3.png)


### adb连接配置
* 此处不同手机、模拟器连接adb的方式是不一样的
* adb的连接不区分手机版教程和电脑版教程, 运行的adb命令都是一样的

* 通常在模拟器中`adb devices`就可以直接看到`emulator-xxxx`,代表adb连接成功了
* 对于安卓手机, 通常要先开启adb调试, 然后`adb pair`开始配对,具体可以查看[控制安卓手机或任意模拟器](../exp/mobile.md). 这个不同品牌手机，不同安卓版本的差异很大. 没有统一的教程. 懂得不用教, 不懂的只能多搜教程了.

* **连接成功的标志,是`adb devices`后能查看到设备**, 例如下面的`emulator-5554`

```
# adb devices
* daemon not running; starting now at tcp:5037
* daemon started successfully
List of devices attached
emulator-5554   device
```


!!! Danger "**如果`adb devices`后, List of device的结果为空,就不用执行下面的命令了,开始学习怎么开启adb吧**"


### 写配置文件
在上一步adb连接成功后,执行`adb devices`, 查看到的地址是`emulator-5554`

所以创建配置文件的命令为

```
cat > config.lin.yaml << EOF
mynode: 0
prefix: wzry
figdir: assets
logfile:
  0: result.0.txt
LINK_dict:
  0: "Android:///emulator-5554"
EOF
```


## 运行
此处以体验服脚本为例
```
python3 tiyanfu.py config.lin.yaml
# wzry 则运行 python3 wzry.py config.lin.yaml
```

![type:video](../fig/termuxRun.mp4)
