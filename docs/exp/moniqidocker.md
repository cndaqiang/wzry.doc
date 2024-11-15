# docker版安卓模拟器测试
## AOSP
### [arm] redroid

* [redroid-doc](https://github.com/remote-android/redroid-doc)
* 多个安卓版本, arm架构流畅王者, x86架构暂未成功王者
* [在甲骨文免费服务器上安装redroid并配置WZRY](docker.md)

## avdmanager 
查看Dockerfile, 发现这些项目的共同点

* `avdmanager`是 Android SDK 工具集的一部分，用于管理 Android 虚拟设备（AVD）
* `emulator`是 Android SDK 中用于启动和运行虚拟设备的命令行工具。它会启动指定的 AVD
* 当你使用 `emulator` 启动一个 AVD 时，实际上是通过 QEMU 来实现硬件模拟的, 所以在x86平台能否模拟arm的安卓还需要qemu支持.
* 通常用于本地模拟 Android 设备，进行开发和测试
* 但是**这种基于android studio emulator的跑大型游戏太卡了, 而且风扇起飞. 别为难自己**

例如
```
avdmanager create avd -n android -k "system-images;android-30;google_apis;x86_64"
emulator -avd android
```

### [amd64] HQarroum/docker-android
* [HQarroum/docker-android](https://github.com/HQarroum/docker-android)
* 首次开机要等待一段时间
* **纯净**的安卓模拟器, 支持gpu加速
* 原版打开王者荣耀打开后黑屏,估计存储太小
* **推荐使用我修改的大内存大存储版本**[cndaqiang/docker-android](https://github.com/cndaqiang/docker-android)

```
docker run -d --device /dev/kvm -p 5555:5555 -v data:/data --name docker-android docker-android.mod
```


### [amd64] budtmo/docker-android
* [budtmo/docker-android](https://github.com/budtmo/docker-android)
* 首次开机要等待一段时间>2min, 画面很好, **自带vnc**
* 可以安装运行王者体验服(无法关闭root,喜提封号一天), 正式服会提示"内存过小"
* 可以在vnc界面启动linux终端和python3.8, 完全可以在里面运行脚本
* 缺点, 很卡, 重启有概率无法启动vnc
* 进vnc但无法启动模拟器,重启也无法解决. 
* **不要碰vnc页面的模拟器设置里面的任何内容和按键**

```
# 自用
docker stop android-container; docker rm android-container;
docker volume rm andata anroot
docker run -d --rm -p 6080:6080 -p 5555:5555 -e EMULATOR_DEVICE="Samsung Galaxy S7" -e EMULATOR_ADDITIONAL_ARGS="-memory 6144 -timezone Asia/Shanghai" -v andata:/home/androidusr -v anroot:/root -e WEB_VNC=true  -e EMULATOR_DATA_PARTITION=32g -e EMULATOR_NO_SKIN=true --device /dev/kvm --name android-container dockerhub.anzu.vip/budtmo/docker-android:emulator_14.0
# 分辨率用adb调, 千万别在vnc页面上操作
# 若因为各种原因导致模拟器无法启动，则尝试，也许是版本太低，需要升级
docker exec -it -u0 android-container chmod 777 /dev/kvm
docker exec -d android-container /usr/bin/emulator -avd samsung_galaxy_s10_11.0
```

![docker-android启动vnc截图](../fig/docker-android.png)


## 失败的容器

### amrsa1/Android-Emulator-Docker
* [amrsa1/Android-Emulator-Docker](https://github.com/amrsa1/Android-Emulator-Docker)
* 启动后还要在安装其他的, 安装过程漫长放弃了

```
dockerhub.anzu.vip/amrka/ultimate-android   
docker run -it -d -p 8900:5900 --name androidImage --privileged dockerhub.anzu.vip/amrka/ultimate-android    
# 进入系统
docker exec --privileged -it androidImage bash
# 卡的不行
bash start_appium.sh
```

### react-native-community/docker-android
* [docker-android](https://github.com/react-native-community/docker-android)
* 没找到手册, 创建容器失败


### Android-Emulator-image@amrsa1

* [Android-Emulator-image](https://github.com/amrsa1/Android-Emulator-image)
* 需要自己编译, 网络故障编译失败

```
(base) cndaqiang@vmnode:~/soft/docker$ git clone https://github.com/amrsa1/Android-Emulator-image.git
Cloning into 'Android-Emulator-image'...
remote: Enumerating objects: 220, done.
remote: Counting objects: 100% (22/22), done.
remote: Compressing objects: 100% (14/14), done.
remote: Total 220 (delta 11), reused 8 (delta 8), pack-reused 198 (from 1)
Receiving objects: 100% (220/220), 44.15 KiB | 332.00 KiB/s, done.
Resolving deltas: 100% (101/101), done.
(base) cndaqiang@vmnode:~/soft/docker$ cd Android-Emulator-image/
(base) cndaqiang@vmnode:~/soft/docker/Android-Emulator-image$ s
s: command not found
(base) cndaqiang@vmnode:~/soft/docker/Android-Emulator-image$ docker build -t android-emulator .
[+] Building 10.2s (2/3)                                                 docker:default
 => [internal] load build definition from Dockerfile                               0.0s
 => => transferring dockerfile: 3.71kB                                             0.0s
 => [internal] load .dockerignore                                                  0.0s
 => => transferring context: 178B                                                  0.0s
 => [internal] load metadata for docker.io/library/openjdk:18-jdk-slim            10.2s
ERROR: failed to solve: DeadlineExceeded: DeadlineExceeded: DeadlineExceeded: openjdk:18-jdk-slim: failed to do request: Head "https://registry-1.docker.io/v2/library/openjdk/manifests/18-jdk-slim": dial tcp [2a03:2880:f111:83:face:b00c:0:25de]:443: i/o timeout
```