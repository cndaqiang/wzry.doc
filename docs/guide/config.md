## 配置文件
* 配置文件是**utf8**编码的**yaml**文件.
* **可以只配置基础参数,但是不能乱抄别人的配置参数**
* 建议将配置文件命名为: `config.win.yaml`
* 使用配置文件运行: `python wzry.py config.win.yaml`


## 参数解释
### 基础参数
**基础参数必须设置**

|参数|默认值|含义|
|-|-|-|
|totalnode|1|本脚本一共控制`totalnode`个账户. **组队多排时需要设置**, 如双排时设置`totalnode: 2`|
|mynode|0|本脚本控制的**账户编号**.**多排组队时不用设置**,由程序自动生成,`0,1,2,...,totalnode-1`.**单排时可以手动设置为任意值**,如`mynode: 0`. |
|multiprocessing|False|自动化多进程组队.**多排组队时一定要设置为`True`**.|
|LINK_dict|None|每个账户所在的模拟器ADB地址, **所有账户的ADB地址都要配置**. <br> 通常为`mynode: "Android:///ip:端口"`. <br> 如果是USB连接的手机或者adb查看到模拟器的主板编号为`emulator-5554`, 则配置信息为`mynode: "Android:///emulator-5554"`.|

!!! tip "虽然基础参数不包括`logfile`, 但是强烈建议设置,具体解释见[调试参数](#调试参数)"


#### 单排账户示例

```
mynode: 0
LINK_dict:
  0: Android:///127.0.0.1:5555
logfile:
  0: result.0.txt
```

#### 双排账户示例
```
# 多进程时,多进程的数目
totalnode: 2
# 多进程配置
multiprocessing: True
# 所有账户的ADB地址
LINK_dict:
  0: Android:///127.0.0.1:5555
  1: Android:///127.0.0.1:5557
logfile:
  0: result.0.txt
  1: result.1.txt
```


### 调试参数
**调试参数通常无需设置**, 只有在调试代码或者有特定需求时才需要设置

|参数|默认值|含义|
|-|-|-|
|prefix|None|程序标志, **推荐设置**为`WZRY`, 不设置也没问题. |
|tmpdir|`系统临时目录/airtest_mobileauto/prefix`|airtest_mobileauto运行过程中用于同步等功能的临时文件存储目录,自动生成, **通常无需设置**.  如果在电脑上**同时运行了很多脚本**,建议为不同的脚本配置不同的`prefix`自动生成`tmpdir`. 万一(不大可能)可以单排,多排总是同步出错,可以清空`C:\Users\用户名\AppData\Local\Temp\airtest_mobileauto`中的文件再执行脚本.|
|logfile|None|将每个账户的脚本执行日志输出到指定文件,例如`{mynode:"restul.mynode.txt"}`.**推荐设置**.在脚本总是报错时,可以开启此参数,将运行日志上传到[github](https://github.com/cndaqiang/WZRY/issues)提问.|
|outputnode|None|只输出账户编号mynode等于outputnode的日志,**无需设置**.|
|logger_level|1|日志等级,`0 DEBUG, 1 INFO, 2 WARNING, 3 ERROR, 4 CRITICAL`,**无需设置**.|
|figdir|`assets`|  优先从`figdir`的目录查找图片资源, 找不到则采用默认的图片, **通常无需设置**. 适合于二次开发/调试/游戏更新时, 覆盖掉代码自带的图片资源.|

示例
```
# 可以为mynode=0,1,2,...,totalnode-1 每一个账户设置单独的输出
# 也可以只为部分账户,例如0,2设置输出,如下
logfile:
  0: result.0.txt
  2: result.2.txt
prefix: "wzry"
```

### 模拟器参数
* **模拟器参数可以不设置**.
* 设置后,脚本支持控制模拟器的开关机,老板键自动隐藏模拟器等功能.
* 一个配置文件中只能配置一种模拟器.仅需关注自己使用的模拟器参数.

|参数|默认值|含义|
|-|-|-|
|LDPlayerdir|None|雷电模拟器控制程序`ldconsole.exe`所在的文件夹,例如`D:\GreenSoft\雷电模拟器.9.0.65.0.x64.去广告绿色版\LDPlayer`|
|MuMudir|None|MuMu模拟器控制程序`MuMuManager.exe`所在的文件夹,例如`D:\Program Files\Netease\MuMu Player 12\shell`|
|BlueStackdir|None|BlueStack模拟器控制程序`HD-Player.exe`所在的文件夹,例如`C:\Program Files\BlueStacks_nxt`|
|LDPlayer_Instance|{mynode:"instance"}|每个账户所在的模拟器在雷电多开管理器内部的**模拟器实例(instance)编号**, 用于启动、关闭mynode账户所在的模拟器实例. [mynode与instance的区别](#mynode与instance的区别).|
|MuMu_Instance|{mynode:"instance"}|每个账户所在的模拟器在MuMu多开管理器内部的**模拟器实例编号**, 用于启动、关闭mynode账户所在的模拟器实例.[mynode与instance的区别](#mynode与instance的区别).|
|BlueStack_Instance|{mynode:"Nougat32_instance"}|每个账户所在的模拟器在BlueStacks多开管理器内部的**模拟器实例编号**, 用于启动mynode账户所在的BlueStacks模拟器实例.[mynode与instance的区别](#mynode与instance的区别).|
|BlueStack_Windows|{mynode:"BlueStacks App Player instance"}|BlueStacks没有提供关闭模拟器的接口,需要使用windows的命令关闭模拟器实例的窗口名称. **建议在多开管理器里修改为简短的名字**,例如`BlueStacks0`,`BlueStacks1`等|
|start_device|None|自定义安卓设备的启动命令. 本脚本内置了[BlueStack/LDPlayer/MuMu模拟器](../exp/moniqi.md)的启动指令, 使用`xxx_Instance`控制模拟器的启动关闭. 如果你使用其他模拟器或者多个模拟器混合使用或者在vmware等虚拟机中安装的安卓系统, 可以利用`start_device`自定义每个安卓设备的启动命令. 例如[腾讯手游助手和MuMu的组队配置](../exp/iosapp.md#腾讯手游助手和mumu模拟器自动化启动和控制)|
|stop_device |None|自定义安卓设备的关闭命令.同`start_device`|
|BossKey|内置|自定义安卓设备的老板键,**无需设置**,airtest_mobileauto内部已经配置了BlueStack/LDPlayer/MuMu模拟器默认的老板键.本脚本启动模拟器后,会自动隐藏模拟器窗口.若自定义了老板键或有更多需求,自行查看airtest_mobileauto的代码.|

#### 模拟器配置示例
??? Warning  "点击展开:雷电模拟器配置示例"
    图中模拟器的Instance被鼠标选中，其对应的配置文件如下
    <pre><code>
    mynode: 0
    LINK_dict:
      0: Android:///127.0.0.1:5555
    LDPlayerdir: D:\GreenSoft\雷电模拟器.9.0.65.0.x64.去广告绿色版\LDPlayer
    LDPlayer_Instance:
        0: "0"
    </code></pre>
    ![雷电模拟器配置示例](../fig/ld_instance.png)


??? note "点击展开:MuMu模拟器配置示例"
    图中模拟器的Instance被鼠标选中，其对应的配置文件如下
    <pre><code>
    mynode: 0
    LINK_dict:
      0: Android:///127.0.0.1:16384
    MuMudir: D:\Program Files\Netease\MuMu Player 12\shell
    MuMu_Instance:
        0: "0"
    </code></pre>
    ![MuMu模拟器配置示例](../fig/mumu_instance.png)


??? Question "点击展开:BlueStacks模拟器配置示例"
    图中模拟器的Instance被鼠标选中，其对应的配置文件如下，**注意BlueStacks模拟器要额外提供模拟器的窗口名字`BlueStack_Windows`**
    <pre><code>
    mynode: 1
    LINK_dict:
      1: Android:///127.0.0.1:5565
    BlueStackdir: C:\Program Files\BlueStacks_nxt
    BlueStack_Instance:
        1: "Pie64_1"
    BlueStack_Windows:
        1: BlueStacks1
    </code></pre>
    ![BlueStacks模拟器配置示例](../fig/blue_instance.png)

??? Success "点解展开:自定义安卓启动配置(腾讯手游助手和MuMu混用)示例"
    注意配置文件中的**单引号**和**双引号**, 将自定义的开启关闭命令填写到`start_device`和`stop_device`. <br>
    mynode = 0 是腾讯手游助手的模拟器,ios区大号<br>
    mynode = 1 是mumu模拟器,安卓区小号 <br>
    腾讯手游助手暂未找到关闭命令, 可以不配置<br>
    **腾讯手游助手的启动需要管理员权限**,所以要用管理员权限执行python
    <pre><code>
    multiprocessing: True
    totalnode: 2
    LINK_dict:
        0: Android:///127.0.0.1:5555
        1: Android:///127.0.0.1:16384
    start_device:
        0: '"D:\Program Files\TxGameAssistant\ui\AndroidEmulator.exe"  -vm 100'
        1: '"D:\Program Files\Netease\MuMu Player 12\shell\MuMuManager.exe" control -v 0 launch'
    stop_device:
        1: '"D:\Program Files\Netease\MuMu Player 12\shell\MuMuManager.exe" control -v 0 shutdown'
    </code></pre>
    ![腾讯mumu自动化启动](../fig/txmumuauto.png)

#### mynode与Instance的区别
* 账户编号**mynode是游戏账户的编号**, 一定是整数, `mynode=0,1,2,...,totalnode-1`. 脚本根据mynode控制每个游戏账号的行为. 例如`LINK_dict[mynode]`是模拟器的ADB地址,`logfile[mynode]`是日志文件,``xxx_Instance[mynode]`是模拟器的实例编号,`WZRY.mynode.运行模式.txt`控制mynode账户的对战礼包等模式. 单排时由用户在配置文件中设置`mynode: N`. 组队时默认从0开始.
* 模拟器实例编号**Instance是模拟器的多开管理器内部的编号**. 不同模拟器的编号规则不同, 可能是整数`0,1,2`,也可能是字符串`Pie64,Pie64_1,Pie64_2`等. 需要用户自己打开模拟器的设置/创建快捷方式等操作进行查看.
* mynode和Instance之间的映射关系通过`xxx_Instance[mynode]=Instance`字典指定
* `xxx_Instance[mynode]`是为了控制账户(mynode)所在模拟器(Instance)的启动、关闭、隐藏等操作.
* **`mynode=0`的账户必须是多开组队的大号(开房间的账户).但是`mynode=0`的账户可以使用任意一台模拟器**
    <br>例如,下面的配置中,大号(`mynode=0`)使用第1台模拟器(`Pie64_1`),小号(`mynode=1`)使用第0台模拟器(`Pie64`)
    <pre><code>
totalnode: 2
multiprocessing: True
BlueStackdir: C:\Program Files\BlueStacks_nxt
BlueStack_Instance:
    0: Pie64_1
    1: Pie64
BlueStack_Windows:
    0: BlueStacks1
    1: BlueStacks0
LINK_dict:
    0: Android:///127.0.0.1:5565
    1: Android:///127.0.0.1:5555
    </code></pre>
    ![mynode与Instance随意组合](../fig/blue_win.png)

### docker参数
* 本脚本支持控制运行在docker中的安卓模拟器[remote-android](https://github.com/remote-android/).
* 支持x86、arm服务器, openwrt路由器等环境运行安卓模拟器.
* 这是我的完整安装和使用过程: [在甲骨文免费服务器上安装redroid并配置WZRY](../exp/docker.md)

|参数|默认值|含义|
|-|-|-|
|dockercontain|`{mynode: "androidcontainInstance"}`|每个账户所在的容器的容器名称, 用于启动、关闭mynode账户所在的容器.|

!!! danger "remote-android默认开启了root,王者体验服检测root,会封号体验服账户,请勿在docker中安装体验服."

三个账户组队示例
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


### Iphone/Ipad参数
* 不建议使用Iphone/Ipad, 可以[使用32位腾讯手游助手刷ios区的日活](../exp/iosapp.md)
* Iphone/Ipad的配置极其复杂, 见[苹果手机怎么使用](../qa/qa.md#苹果手机怎么使用)
* 配置参数基本和安卓模拟器的参数相同, 注意**Iphone/Ipad的底层是ios系统, 所以LINK_dict中为`ios`**
* **腾讯手游助手底层是安卓模拟器**, 使用腾讯手游助手刷ios区时,**LINK_dict仍然是`Android`**, 使用方法同上面的安卓模拟器.


Android和Iphone/Ipad的配置示例为

```
totalnode: 2
LINK_dict:
  0: "ios:///http://169.254.148.222:8100"
  1: "Android:///127.0.0.1:5565"
```


