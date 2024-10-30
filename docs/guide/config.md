## 配置文件
* 自版本2.2以来，配置文件随着[airtest_mobileauto](https://github.com/cndaqiang/airtest_mobileauto)同步升级为utf8编码的yaml文件。
* 所有基于airtest_mobileauto开发的程序配置文件规则相同。
* **配置文件必须采用yaml语法,可以只配置基础参数,但是不能乱抄别人的配置参数**




## 参数解释
### 基础参数
|参数|默认值|含义|
|-|-|-|
|totalnode|1|本脚本一共控制`totalnode`个账户。如双排时设置`totalnode=2`|
|mynode|0|本脚本控制的**账户编号**。多排组队时由程序自动生成，`mynode=0,1,2,...,totalnode-1`。**单排时可以手动设置为任意值**。|
|multiprocessing|False|自动化多进程组队。**多排组队时一定要设置`multiprocessing=True`**。|
|LINK_dict|None|每个账户所在的模拟器ADB地址`LINK_dict[mynode]="Android:///ip:端口"`。所以账户的ADB地址都要填写。|

#### 单排账户示例

```
mynode: 0
LINK_dict:
  0: Android:///127.0.0.1:5555
```

#### 双排账户示例
```
# 多进程时，多进程的数目
totalnode: 2
# 多进程配置
multiprocessing: True
LINK_dict:
    0: Android:///127.0.0.1:5555
    1: Android:///127.0.0.1:5557
```


### 调试参数
|参数|默认值|含义|
|-|-|-|
|logfile|None|将每个账户的脚本执行日志输出到指定文件，例如`{mynode:"restul.mynode.txt"}`。**推荐设置**。在脚本总是报错时，可以开启此参数，将运行日志上传到github提问。|
|figdir|assets|脚本图片资源所在目录，无需设置。|
|outputnode|None|只输出账户编号mynode等于outputnode的日志，无需设置。|
|logger_level|1|日志等级,`0 DEBUG, 1 INFO, 2 WARNING, 3 ERROR, 4 CRITICAL`，无需设置。|

示例
```
# 可以为mynode=0,1,2,...,totalnode-1 每一个账户设置单独的输出
# 也可以只为部分账户，例如0,2设置输出，如下
logfile:
  0: result.0.txt
  2: result.2.txt
```

### 模拟器参数
* **模拟器参数不用必须设置**。
* 设置后，脚本支持控制模拟器的开关机，老板键自动隐藏模拟器等功能。
* 一个配置文件中只能配置一种模拟器。仅需关注自己使用的模拟器参数。

|参数|默认值|含义|
|-|-|-|
|LDPlayerdir|None|雷电模拟器控制程序`ldconsole.exe`所在的文件夹，例如`D:\GreenSoft\雷电模拟器.9.0.65.0.x64.去广告绿色版\LDPlayer\`|
|MuMudir|None|MuMu模拟器控制程序`MuMuManager.exe`所在的文件夹，例如`D:\Program Files\Netease\MuMu Player 12\shell`|
|BlueStackdir|None|BlueStack模拟器控制程序`HD-Player.exe`所在的文件夹，例如`C:\Program Files\BlueStacks_nxt`|
|LDPlayer_Instance|{mynode:"mynode"}|每个账户所在的模拟器在雷电多开管理器内部的**模拟器实例(instance)编号**, 用于启动、关闭mynode账户所在的模拟器实例。|
|MuMu_Instance|{mynode:"mynode"}|每个账户所在的模拟器在MuMu多开管理器内部的**模拟器实例编号**, 用于启动、关闭mynode账户所在的模拟器实例。|
|BlueStack_Instance|{mynode:"Nougat32_mynode"}|每个账户所在的模拟器在BlueStacks多开管理器内部的**模拟器实例编号**, 用于启动mynode账户所在的BlueStacks模拟器实例。|
|BlueStack_Windows|{mynode:"BlueStacks App Player mynode"}|BlueStacks没有提供关闭模拟器的接口，需要使用windows的命令关闭模拟器实例的窗口名称|
|BossKey|内置|**无需设置**，airtest_mobileauto内部已经配置了BlueStack/LDPlayer/MuMu模拟器默认的老板键。本脚本启动模拟器后，会自动隐藏模拟器窗口。若自定义了老板键或有更多需求，自行修改airtest_mobileauto的代码。|

#### 模拟器实例编号
`LDPlayer_Instance/MuMu_Instance/BlueStack_Instance`参数是下面图片中鼠标选中区域的文本。

##### 雷电模拟器
下图对应配置
```
mynode: 0
LINK_dict:
  0: Android:///127.0.0.1:5555
LDPlayerdir: D:\GreenSoft\雷电模拟器.9.0.65.0.x64.去广告绿色版\LDPlayer\
LDPlayer_Instance:
    0: "0"
```
![](/wzry.doc/fig/ld_instance.png)
##### MuMu模拟器
下图对应配置
```
mynode: 0
LINK_dict:
  0: Android:///127.0.0.1:16384
MuMudir: D:\Program Files\Netease\MuMu Player 12\shell
MuMu_Instance:
    0: "0"
```
![](/wzry.doc/fig/mumu_instance.png)
##### BlueStacks
下图对应配置
```
mynode: 1
LINK_dict:
  1: Android:///127.0.0.1:5565
BlueStackdir: C:\Program Files\BlueStacks_nxt
BlueStack_Instance:
    1: "Pie64_1"
BlueStack_Windows:
    1: BlueStacks1
```
![](/wzry.doc/fig/blue_instance.png)

#### BlueStacks窗口名称
`BlueStack_Windows`参数是每个多开账户的模拟器的名字，可以在多开管理器里修改名称。下图的名称对应的配置为
```
BlueStack_Windows:
    0: BlueStacks0
    1: BlueStacks1
```
![](/wzry.doc/fig/blue_win.png)

#### 账户编号与模拟器实例编号的区别
* 账户编号mynode是游戏账户的编号，默认从0开始.`mynode=0,1,2,...,totalnode-1`。
* 模拟器实例编号Instance是在模拟器在对应模拟器的多开管理器内部的编号。通常也是`0,1,2,...`
* 两者之间的映射关系通过`xxx_Instance`数组指定，`xxx_Instance`是为了控制模拟器的开机关机等模拟器的操作。

!!! tips
    **`mynode=0`的账户必须是多开组队的大号(开房间的账户)。但是`mynode=0`的账户可以使用任意一台模拟器**
    <br>例如，下面的配置中，大号(`mynode=0`)使用第1台模拟器，小号(`mynode=1`)使用第0台模拟器
```
# 多进程时，多进程的数目
totalnode: 2
# 多进程配置
multiprocessing: True
#默认读入字符串, 不要添加引号
BlueStackdir: C:\Program Files\BlueStacks_nxt
BlueStack_Instance:
    0: Pie64_1
    1: Pie64
BlueStack_Windows:
    0: BlueStacks1
    1: BlueStacks0
#
LINK_dict:
    0: Android:///127.0.0.1:5565
    1: Android:///127.0.0.1:5555
```

### docker参数
* 本脚本支持控制运行在docker中的安卓模拟器[remote-android](https://github.com/remote-android/)。
* 支持x86、arm服务器, openwrt路由器等环境运行安卓模拟器。

|参数|默认值|含义|
|-|-|-|
|dockercontain|`{mynode: "androidcontainmynode"}`|每个账户所在的容器的容器名称, 用于启动、关闭mynode账户所在的容器。|

!!! Wannring
    remote-android默认开启了root，王者体验服检测root,会封号体验服账户，请勿在docker中安装体验服。

#### docker容器的创建与配置
依次创建3个docker容器，并映射端口号到`5555`，分辨率务必设置为`960x540`,dpi为`160`
```
N=0 #1,2
port=5555 #5575,5585
#下面是我在oracle的arm服务器上的配置示例，替换镜像为你自己的服务架构。
docker run -itd  --privileged \
	-p $port:5555 \
	--name androidcontain$N \
	redroid/redroid:8.1.0-arm64 \
	androidboot.redroid_width=960 \
	androidboot.redroid_height=540 \
	androidboot.redroid_dpi=160 \
	androidboot.hardware=WLZ-AN00 ro.secure=0 ro.boot.hwc=GLOBAL    \
	ro.ril.oem.imei=861503068361$((100 + $RANDOM % 900)) ro.ril.oem.imei1=861503068361$((100 + $RANDOM % 900))  \
	ro.ril.oem.imei2=861503068361$((100 + $RANDOM % 900)) ro.ril.miui.imei0=861503068361$((100 + $RANDOM % 900)) \
	ro.product.manufacturer=HUAWEI ro.build.product=chopin \
	androidboot.redroid_fps=5 \
	redroid.gpu.mode=guest
```

3账户组队的配置参数
```
# 节点配置
totalnode: 3
multiprocessing: True
LINK_dict:
    0: "Android:///127.0.0.1:5555"
    1: "Android:///127.0.0.1:5565"
    2: "Android:///127.0.0.1:5575"
dockercontain:
    0: "androidcontain0"
    1: "androidcontain1"
    2: "androidcontain2"
```


### 苹果手机如何配置
* **苹果手机已停止更新，暂无手册计划。**
* 从[1.2.2](https://github.com/cndaqiang/WZRY/releases/tag/1.2.2)版本开始，我的苹果账户已经刷完了，没有精力继续测试维护
* ios部分的代码，太久没有更新，能否使用请自行尝试。
* 这是我当初的运行环境: [Android/IOS移动平台自动化脚本(基于AirTest)](https://cndaqiang.github.io/2023/11/10/MobileAuto/)