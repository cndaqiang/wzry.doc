## 说明
* 组队方式是通过亲密好友**自动进房**不用验证实现的
* **大号(房主)**自动进入房间
* 小号进入人机房间后,开始检测游戏界面,当发现有**房主房间**这个图片时,会自动进房间.
* 组队前需要小号和大号建立**亲密关系**(王者的亲密好友进房免验证)
* **不满足上述条件无法组队**
* 本脚可以**流畅三排组队**. 不建议四排和五排, 账户越多同步时间越久.


## 配置文件
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

## 更新图片资源
源代码中,房主的头像是我的账号,你要替换代码中`self.房主头像`和`self.房主房间`对应静态图片为你的.
```
self.房主头像 = Template(r"tpl1716782981770.png", record_pos=(0.354, -0.164), resolution=(960, 540), target_pos=9)
self.房主房间 = Template(r"tpl1700284856473.png", record_pos=(0.312, -0.17), resolution=(1136, 640), target_pos=2)
```

### 截图流程

* 阅读[图片更新](tupiangengxin.md)教程
* 阅读[Airtest截取英雄分路坐标的流程](shuliandu.md#计算绝对坐标的步骤)
* 大号小号分别创建房间
* 打开AirTestIDE,连接小号的账户,截取屏幕右侧大号的`房主头像` 这个区域
![房主头像](../fig/tpl1716782981770.png)
* 点击进房后,可以继续截图`房主房间`这个区域
![房主房间](../fig//tpl1700284856473.png)

!!! tip "仅更新*房主头像*就行了,我就一直没有更新*房主房间*这张图."
    


### 更新图片

* 将airtest截到的图片放到脚本目录,并复制AirtestIDE生成的`Template(r"tplXXXXX.png",xxxx)`的代码,添加到`WZRY.图片更新.txt`
* 将`, target_pos=9`和`, target_pos=2`分别添加到`self.房主头像`和`self.房主房间`后面
* 即最终你的`WZRY.图片更新.txt`中的内容应该类似下面的内容
```
self.房主头像 = Template(r"tpl1716782981770.png", record_pos=(0.354, -0.164), resolution=(960, 540), target_pos=9)
self.房主房间 = Template(r"tpl1700284856473.png", record_pos=(0.312, -0.17), resolution=(1136, 640), target_pos=2)
```

!!! note "不想改代码,可以直接截图替换"
    如果你不想改代码, **把截到的房主头像图片,重命名为`tpl1716782981770.png`, 替换`assets`文件夹中的图片**也可以.<br>
    如果你之后更新了WZRY代码,记得重复替换操作.<br>
    我更推荐写在`WZRY.图片更新.txt`,不受WZRY更新的影响.<br>
    注意, 王者活动的[更新资源](upfig.md)包也是将更新的资源填写到`WZRY.图片更新.txt`里面的.
    

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