## 说明
* 组队方式是通过亲密好友**自动进房**不用验证实现的
* **大号(房主)**自动进入房间
* 小号进入人机房间后,开始检测游戏界面,当发现有**房主头像**这个图片时,会自动进房间.
* 组队前需要小号和大号建立**亲密关系**(王者的亲密好友进房免验证)
* **不满足上述条件无法组队**
* 本脚可以**流畅三排组队**. 不建议四排和五排, 账户越多同步时间越久.


## 组队配置文件
**`mynode=0`所对应的账户是房主, 即LINK_dict[0]是房主所在模拟器的ADB地址**
```
# 2个账户组队
totalnode: 2
# 多进程配置
multiprocessing: True
# 
LINK_dict:
    0: Android:///127.0.0.1:5555
    1: Android:///127.0.0.1:5557
```

## 截图房主头像

源代码中,进房间的图片是我的账号,<br>你要替换代码中`self.房主头像`对应静态图片为你的大号头像.


如果不了解AirTestIDE的截图方法,请先阅读

* [图片更新](tupiangengxin.md)教程
* [Airtest截取英雄分路坐标的流程](shuliandu.md#计算绝对坐标的步骤)


在会使用AirTestIDE的TOUCH按钮截图后,

* 大号小号分别创建房间
* 打开AirTestIDE,连接小号的账户,截取屏幕右侧大号的`房主头像` 这个区域
![房主头像](../fig/tpl1716782981770.png)

## 更新房主头像
### 方法1: 替换代码资源

> **把截到的房主头像图片,重命名为`tpl1716782981770.png`, 替换`assets`文件夹中的图片**即可.


### 方法2: 更新图片接口
* 在运行目录创建`WZRY.图片更新.txt`
* 将airtest截到的图片放到运行目录,
* 复制AirtestIDE生成的`Template(r"tplXXXXX.png",xxxx)`的代码,添加到`WZRY.图片更新.txt`
* 将`, target_pos=9`添加到`Template(r"tplXXXXX.png",xxxx)`中
* 即最终你的`WZRY.图片更新.txt`中的内容应该类似下面的内容

```
self.房主头像 = Template(r"tplXXXXX.png", record_pos=(0.354, -0.164), resolution=(960, 540), target_pos=9)
```

    

## 限制组队的时间
在每一个的账户的[`WZRY.mynode.运行模式.txt`](file.md)中都插入
```
# 所有账户的对战时间
self.对战时间=[0.1,23.0]
# 12点之前组队,12点之后,各自刷各自的
self.限时组队时间=12
# 前5局组队,之后,各自刷各自的
if self.jinristep >  5:  self.Tool.touchfile(self.无法进行组队FILE,"对局已超过5次")
```