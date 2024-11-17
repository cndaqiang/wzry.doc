## 王者荣耀礼包
若需调整第`mynode`个账户领取哪些礼包

* 则在`wzry.py`所在的文件夹,创建`WZRY.mynode.运行模式.txt`文件
* **把`mynode`替换为你的[账户编号](config.md#mynode与instance的区别)**
* 文件为UTF8格式编码, 内容为标准的python语法,不支持超过一行的python语句.

有些礼包没必要领取:

* **有时间限制的礼包, 比如`活动礼包`,`祈愿礼包`,`玉镖夺魁签到`,`礼包功能_KPL礼包`**, 这些活动很久才出现一次, 平时都保持为`False`节省时间.
* **没有性价比的礼包, 比如`友情礼包_铭文碎片`,`友情礼包_击败宝箱`**, 也建议设置为`False`
* **老用户没必要领的礼包, 比如`友情礼包_英雄碎片`,`礼包功能_战队礼包`**, 也建议设置为`False`
* 关于`每日任务礼包`礼包是否要领取, 可以看[战令经验最大化](../exp/zhanling.md)

目前支持的礼包包括
```
# 礼包功能默认关闭,设置为True,开启礼包功能
self.启动礼包功能 = True
# 下面的礼包需要领取,则设置为True
self.活动礼包 = False
self.祈愿礼包 = False
self.玉镖夺魁签到 = False
self.每日任务礼包 = False
self.礼包功能_邮件礼包 = False
self.礼包功能_妲己礼物 = False
self.礼包功能_友情礼包 = False
self.友情礼包_积分夺宝 = False
self.友情礼包_皮肤碎片 = False
self.友情礼包_英雄碎片 = False
self.友情礼包_铭文碎片 = False
self.友情礼包_皮肤宝箱 = False
self.友情礼包_回城宝箱 = False
self.友情礼包_击败宝箱 = False
self.友情礼包_排位保护 = False
self.礼包功能_回忆礼册 = False
self.礼包功能_灵宝互动 = False
# 外置礼包,暂无手册,遇到问题,请自行调试
# 支持自动领取相同模拟器内部的王者营地礼包
self.外置礼包_王者营地 = False
# 支持自动领取相同模拟器内部的王者体验服的体验币
self.外置礼包_体验服 = False
# 精力有限, 以下礼包不会随着游戏更新立刻进行升级维护,如果遇到问题,请先自行调试
self.礼包功能_战队礼包 = False
self.礼包功能_商城礼包 = False
self.礼包功能_KPL礼包 = False
```


## 王者营地礼包
* 体验币换皮肤碎片、营地币换英雄碎片、战令经验包、签到、观赛等.
* 可以独立启动、不依赖于`wzry.py`, 王者营地所在模拟器的ADB信息填到`config.ce.yaml`

```
python -u wzyd.py config.ce.yaml
```


## 体验服礼包
* 体验服: 更新体验服领取体验币
* 可以独立启动、不依赖于`wzry.py`, 王者体验服所在模拟器的ADB信息填到`config.ce.yaml`

```
python -u tiyanfu.py config.ce.yaml
```

!!! Warning
    在Root的安卓上登录体验服,会被封号,与本脚本无关.如使用体验服的功能,请关闭模拟器的Root选项