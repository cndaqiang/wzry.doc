## 我只想简单的刷日常活动,没有能力阅读你这么长的教程
就按照这个[基础的图文教程](tuwen.md),一步一步的抄作业.

## 配置python环境
### 安装python
* 推荐使用Anaconda.
* Anaconda 安装包可以到[TUNA](https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/)下载.

### 安装依赖

* 使用Anaconda的用户可以打开`Anaconda Powershell Prompt`后执行
```
python -m pip install airtest_mobileauto --upgrade
```


## 设置模拟器分辨率和ADB调试.
* 推荐使用[BlueStack/LDPlayer/MuMu模拟器](../exp/moniqi.md).
* 模拟器的分辨率设置为`960x540`,dpi为`160`.
* 安装王者, **强烈建议下载所有游戏资源**, **并手动进入游戏大厅**.<br>
(若不下载所有的游戏资源, 在返回大厅时, 王者总会弹窗让你更新资源, 本脚本虽然能够处理这些弹窗, 但是极其的浪费时间.)


## 下载代码
* 打开[WZRY](https://github.com/cndaqiang/WZRY)
* 点击右上角的star👻立刻获得免费下载资格.

### 核心程序
* 从Releases页面下载最新的[Source code (zip)](https://github.com/cndaqiang/WZRY/releases).
* 解压到`WZRY-x.x.x`(x.x.x为版本号).
* **请务必使用最新版本`>=2.2.8`**

### 更新资源
* **通常是不需要更新资源的**.
* WZRY有特殊活动(比如周年庆)时,登陆界面的对战按钮等图片元素会改变, 此时需要**临时**更新这些图片.
* 查看页面**[资源更新包](upfig.md)**确定是否需要更新资源以及更新方法.



## 运行方式

### 方式1. 直接运行
* 当使用BlueStack/LDPlayer等默认ADB是`127.0.0.1:5555`的模拟器时可以直接运行脚本.
* 使用Anaconda的用户可以打开`Anaconda Powershell Prompt`后执行
```
# 进入代码目录
cd D:\Download\WZRY-2.2.6
# 执行脚本
python -u wzry.py
```

### 方式2. 使用配置文件运行
!!! Note
    在使用MuMu模拟器或者直接运行无法连接模拟器时,需要在[配置文件](config.md)中填写模拟器的ADB地址.
    详见[配置文件的写法](config.md).

MuMu模拟器使用配置文件示例

* 在模拟器的设置里查看ADB的地址为`127.0.0.1:16384`
* 创建`config.win.yaml`,填入下面内容
```
mynode: 0
LINK_dict:
    0: Android:///127.0.0.1:16384
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