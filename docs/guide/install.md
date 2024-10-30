## 我只想简单的刷日常活动，没有能力阅读你这么长的教程
就按照这个[基础的图文教程](/wzry.doc/guide/tuwen/)，一步一步的抄作业。

## 配置python环境
### 安装python
* 推荐使用Anaconda。
* Anaconda 安装包可以到[TUNA](https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/)下载。

### 安装依赖

* 使用Anaconda的用户可以打开`Anaconda Powershell Prompt`后执行
```
python -m pip install airtest_mobileauto --upgrade
```


## 设置模拟器分辨率和ADB调试。
* 推荐使用[BlueStack/LDPlayer/MuMu模拟器](https://github.com/cndaqiang/WZRY/issues/23)。
* 模拟器的分辨率设置为`960x540`,dpi为`160`。
* 安装WZRY. **并手动进入游戏大厅**。


## 下载代码
### 核心程序
* 从Releases页面下载最新的[Source code (zip)](https://github.com/cndaqiang/WZRY/releases)。
* 解压到`WZRY-x.x.x`(x.x.x为版本号)。

### 更新资源
* 通常是不需要更新资源的。
* **WZRY有特殊活动(比如周年庆)时，可以看看我是否提供了**[资源更新包](https://github.com/cndaqiang/WZRY/issues/8)。
* * 也可以自己使用AirTestIDE修改对应的图片。
* 活动结束后，删除下载的更新资源。


## 运行方式

### 方式1. 直接运行
* 当使用BlueStack/LDPlayer等默认ADB是`127.0.0.1:5555`的模拟器时可以直接运行脚本。
* 使用Anaconda的用户可以打开`Anaconda Powershell Prompt`后执行
```
# 进入代码目录
cd D:\Download\WZRY-2.1.2
# 执行脚本
python -u wzry.py
```

### 方式2. 使用配置文件运行
* 在使用MuMu模拟器或者直接运行无法连接模拟器时，需要配置模拟器的ADB地址。
* 在模拟器的设置里查看ADB的地址, 例如MuMu模拟器通常是`127.0.0.1:16384`
* 创建`config.win.yaml`,填入下面内容
```
mynode: 0
LINK_dict:
    0: Android:///127.0.0.1:16384
logfile:
    0: result.0.txt
```
* 运行脚本
```
python -u wzry.py config.win.yaml
```


### 方式3. 在vscode/pycharm等软件中
* 创建配置文件`config.win.yaml`,同上
* 修改`wzry.py`中的`config_file = ""`为`config_file = "config.win.yaml"`
```
if __name__ == "__main__":
    # 如果使用vscode/pycharm/AirTestIDE等图形界面程序运行此脚本
    # 在此处指定config_file=config文件
    config_file = "" # 修改此处
    if len(sys.argv) > 1:
        config_file = str(sys.argv[1])
```
* 运行