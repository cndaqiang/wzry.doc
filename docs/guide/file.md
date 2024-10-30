## 说明
* **通过创建一些文件来精细的操作代码的运行**
* **所有文件都放在`wzry.py`所在路径，采用txt结尾，UTF8格式编码**
* 这些文件不参与仓库同步。

## 控制文件
|文件名|功能|
|-|-|
|WZRY.oneday.txt|用户手动创建。存在该文件时，则本脚本在完成日常对战礼包活动后自动退出程序以及关闭模拟器。里面记录了总对战次数，再次运行脚本时，会读取其中的对战次数。**建议创建**，后续程序自动更新。|
|WZRY.TOUCH.txt|用户手动创建。存在该文件时，则在5v5的对战过程中,自动移动和平A。可以通过活动的挂机检测。|

## python语法注入文件
* 直接在程序执行的过程中注入python的命令，任意修改脚本的运行模式。
* 标准的python语法，不支持超过一行的python语句。
* 目前支持下面三种文件。

|文件名|推荐填写的控制命令|
|-|-|
|`WZRY.{self.mynode}.临时初始化.txt`    | 控制脚本功能：运行时间、[礼包](/wzry.doc/guide/libao/)等功能的开启关闭。|
|`WZRY.{self.mynode}.对战前插入.txt`    | 控制对局过程：[对战模式(快速对战、标准对战、TOUCH模式)](/wzry.doc/guide/duizhanmoshi/)、对战分路、对战英雄、[自动选择熟练度最低的英雄](/wzry.doc/guide/shuliandu/)。|
|`WZRY.{self.mynode}.重新设置英雄.txt`  | 覆盖上面的设定，选择指定英雄|

!!! note 
    **替换文件名中的`{self.mynode}`为需要调控的账户编号`mynode`**, 需要控制哪个账户，就**自己新建**对应mynode的注入文件。


### [示例]设定游戏的运行时间
仅在每天的5点到17点执行脚本，在`WZRY.{self.mynode}.临时初始化.txt` 中填写
```
self.对战时间=[5,17]
```

每天只对战5局，在`WZRY.{self.mynode}.临时初始化.txt` 中填写
```
if self.jinristep >=  5:  self.对战时间[0]=0.1
if self.jinristep >=  5:  self.对战时间[1]=0.2
```

### [示例]开启礼包功能
在`WZRY.{self.mynode}.临时初始化.txt` 中填写
```
# 礼包功能默认关闭，设置为True，开启礼包功能
self.启动礼包功能 = True
```

### [示例] 前2局标准对战并移动
在`WZRY.{self.mynode}.对战前插入.txt` 中填写
```
self.标准模式 = self.触摸对战 = False
if self.jinristep <= 2: self.标准模式 = self.触摸对战 = True
```

### [示例] 指定对战的分路和英雄
在`WZRY.{self.mynode}.重新设置英雄.txt`中填写下面内容

```
#选择对抗路-八戒对战
tmp_参战英雄线路=Template(r"tpl1689665490071.png", record_pos=(-0.315, -0.257), resolution=(960, 540)) #对抗路
tmp_参战英雄头像=Template(r"tpl1701573854122.png", record_pos=(-0.315, -0.257), resolution=(960, 540))
#点击屏幕
self.Tool.existsTHENtouch(tmp_参战英雄线路,"tmp_参战英雄线路")
sleep(2)
self.Tool.existsTHENtouch(tmp_参战英雄头像,"tmp_参战英雄头像")
```

!!! Note
    其他分辨率、分路、英雄，请进入选英雄界面后，使用AirtestIDE的touch进行截取图。把AirtestIDE截到的图片复制到脚本目录，并替换上面代码中的Template为AirtestIDE生成的Template语法。截取的范围见`assets`文件夹的`tpl1689665490071.png`和`tpl1701573854122.png`,即
    ![](https://cndaqiang.github.io/WZRY/assets/tpl1689665490071.png)
    ![](https://cndaqiang.github.io/WZRY/assets/tpl1701573854122.png)