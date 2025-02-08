* Python新手, 不了解ADB, 暂时没时间阅读下面的教程, 查看[视频教程⭐](https://www.bilibili.com/video/BV1JmcteBEUS)或[图文教程🔗](../guide/tuwen.md).
* 教程有看不懂的地方, 可以[提出问题](https://github.com/cndaqiang/WZRY/issues), 然后点个[star⭐](https://github.com/cndaqiang/WZRY)召唤我回答.

> [代码会随着新赛季更新, 教程里面可能是用老代码演示的, **请务必从releases下载最新版本的代码**](https://github.com/cndaqiang/WZRY)


## 安装模拟器和登陆游戏 
* **推荐将游戏安装到[BlueStack/LDPlayer/MuMu模拟器/腾讯手游助手](../exp/moniqi.md)中**.
* 模拟器的分辨率设置为`960x540`,dpi为`160`.
* **开启模拟器的ADB调试**
* **安装王者、扫码登录账号, 下载所有游戏资源, 并手动进入游戏大厅**.

!!! Note "其他建议"
    * **不要在模拟器上安装登录微信**, 详情搜索*模拟器封微信*, 扫码登录游戏没有任何风险.
    * 在新设备/模拟器上登录游戏账号, **首次**进入人机房间、战令、战队、KPL赛事、领取各种礼包等界面时,<br>王者总会有各种**弹窗**、强制观看视频等.
    * 本脚本虽然能够处理这些弹窗, 但是极其的浪费时间.
    * 更新完游戏资源,并手动进入过上述界面关闭弹窗后, 可以大大加速脚本的执行速度.
    * **本脚本通过模拟人手点击进行,至今未受到任何警告处罚。但请你为自己的账户负责。**
    * 请**关闭模拟器的root**, 本脚本不需要root权限, root会封禁体验服的账户.
    * 请遵守游戏协议、**不要安装违反游戏平衡的软件**、不要修改王者APP以及游戏数据。
    * 请使用官方允许的方式在安卓设备上登录ios区的账户, **不要使用第三方修改之后的模拟器、版本过低的模拟器以及小众模拟器**。
    * 🔥ios区的账户请使用[**腾讯官方的手游助手刷ios区的账户**](../exp/iosapp.md)
    * 不建议控制苹果手机, 非常复杂, 头铁用户见[苹果手机怎么使用](../qa/qa.md#苹果手机怎么使用)
    * 如果不想使用模拟器, 请阅读[控制安卓手机或任意模拟器](../exp/mobile.md).
    * 如果不想使用电脑**并且你是一个非常有耐心和技术的人**, 请阅读[只用一部手机、不依赖电脑运行自动化脚本](../exp/termux.md)


## 配置环境
### 安装 Python

* Python新手, 推荐安装Anaconda(可以到[TUNA](https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/)下载最新的安装包)
* Python老手, 用你喜欢的Python就行.

### 安装依赖

* 打开终端(若安装了Anaconda, 打开`Anaconda Powershell Prompt`), 执行:

```
python -m pip install airtest_mobileauto --upgrade
```

* 如果无法更新`airtest_mobileauto`(或者下载网速过慢), 请查看[Q&A:没法安装airtest_mobileauto](../qa/qa.md#没法安装airtest_mobileauto)

![Anaconda_Powershell_Prompt|200](../fig/anaconda_powershell_prompt.png)
![安装airtest_mobileauto](../fig/anaconda_powershell_prompt2.png)


## 下载代码
* 打开[https://github.com/cndaqiang/WZRY](https://github.com/cndaqiang/WZRY),  **点击右上角的star👻.**
* 点击右下角的release, 即[https://github.com/cndaqiang/WZRY/releases](https://github.com/cndaqiang/WZRY/releases)页面,  下载**最新**的Source code (zip).
* 如果无法访问[https://github.com/cndaqiang/WZRY](https://github.com/cndaqiang/WZRY), 请查看[Q&A:没办法下载WZRY代码](../qa/qa.md#没办法下载wzry代码)
* 下载后解压得到`WZRY-x.x.x`或`autowzry-x.x.x`(x.x.x为版本号).
* **请务必从releases下载最新版本的代码**
* **请务必从releases下载最新版本的代码**
* 虽然本教程在撰写的时候是用的旧版本, 但是你在照着教程做时, **请务必从releases下载最新版本的代码**, 每个赛季的对战、结算、战令界面都有更新, 老版本代码无法适配.


### 更新资源
* **通常是不需要更新的**. 王者重大活动期间, 例如周年庆、冰雪奇缘联动等,才需要**临时**更新.
* **更新判据: 如果大厅的对战图标不是![大厅对战图标](../fig/tpl1723219359665.png),就需要更新**
* 在**[更新资源](upfig.md)**页面可以获得更新资源以及更新方法, 视频教程见[农活自动化助手: 适配王者荣耀冰雪奇缘联动界面更新](https://www.bilibili.com/video/BV13NrzYMEqW).



## 运行方式

### 方式1. 直接运行
* 当模拟器的ADB地址是`127.0.0.1:5555`时(比如雷电模拟器), 可以直接运行脚本`python -u wzry.py`
* **若运行脚本后无法连接模拟器，或有组队需求，请[使用配置文件运行](#方式2-使用配置文件运行)**
* 打开支持python的终端(安装Anaconda后,打开`Anaconda Powershell Prompt`), 执行:
```
# 进入wzry.py所在的目录
cd D:\Download\WZRY-2.3.2.2
# 执行脚本
python -u wzry.py
```


### 方式2. 使用配置文件运行
> [配置文件](config.md)中包含模拟器的adb地址信息、组队信息等诸多信息.<br>
> 若adb地址是`emulator-5554`不是端口为`5554`的含义, 更详见[配置文件的写法](config.md).

MuMu模拟器使用配置文件示例

* 在模拟器的设置里查看ADB的地址为`127.0.0.1:16384`
* 在代码目录创建`config.win.yaml`,填入下面内容
```
mynode: 0
LINK_dict:
    0: Android:///127.0.0.1:16384
```
* 打开支持python的终端(安装Anaconda后,打开`Anaconda Powershell Prompt`), 执行:
```
# 进入wzry.py代码目录
cd D:\Download\WZRY-2.3.2.2
# 执行脚本
python -u wzry.py config.win.yaml
```


### 方式3. 在vscode等软件中
* 创建配置文件`config.win.yaml`,同上
* 修改`wzry.py/wzyd.py/tiyanfu.py`中的`config_file = ""`为`config_file = "config.win.yaml"`
```
def main():
    # 如果使用vscode等IDE运行此脚本
    # 在此处指定config_file=config文件
    config_file = ""
```
* 运行

### 方式4. 使用autoWZRY
* 更多见[进阶教程](../guide/autowzry.md)

```
python -m pip install autowzry --upgrade
autowzry config.win.yaml
```