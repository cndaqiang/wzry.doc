## 说明
若需调整第`mynode`个账户领取哪些礼包

* 则在`wzry.py`所在的文件夹，创建`WZRY.mynode.临时初始化.txt`文件
* **把`mynode`替换为你的账户编号**
* 文件为UTF8格式编码, 内容为标准的python语法，不支持超过一行的python语句。

目前支持的礼包包括
```
# 礼包功能默认关闭，设置为True，开启礼包功能
self.启动礼包功能 = True
# 下面的礼包需要领取，则设置为True
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
# 外置礼包，暂无手册，遇到问题，请自行调试
self.外置礼包_王者营地 = False
self.外置礼包_体验服 = False
# 以下礼包不再维护，如果遇到问题，请自行调试
self.礼包功能_战队礼包 = False
self.礼包功能_商城礼包 = False
self.礼包功能_KPL礼包 = False
```
