# 运行模式配置示例
## 说明
* 该页面是介绍我的使用经验,不是教程
* 随着软件更新,这些经验可能不再适用
* 谨慎阅读



## 我在使用的`WZRY.0.运行模式.txt`
```
#................................................................................
uptime=20.9
self.对战时间=[1.0,uptime]
self.限时组队时间=uptime
#................................................................................
#周四的3点, 营地的战令任务就领完了 self.Tool.time_getweek() == 3, 周四当天就可以多刷对战的金币钻石了
#4,5,6,7四天侃侃能领完一周的王者所有任务
wzydday = 3 #
#每天组队打0,1,2,...,nstep-1共nstep场，组队5v5匹配&触摸, 日活检测
#每天单人打0,1,2,...,ostep-1共ostep场，模拟战|单人5v5匹配&星耀人机
nstep=2
ostep=1 if self.Tool.time_getweek() < wzydday  else 2
ostep=ostep if self.mynode == 0 else 1 # 小号对战少
if self.jinristep >  nstep+ostep: self.对战时间[1]=self.对战时间[0]+0.1
#对战模式
self.对战模式="模拟战" if self.Tool.time_getweek() < wzydday and self.jinristep > nstep else "5v5匹配"
if self.jinristep <= nstep: self.标准模式 = self.触摸对战 = self.青铜段位 = True
if self.jinristep  > nstep: self.标准模式 = self.触摸对战 = self.组队模式 = False
# self.组队模式 是由脚本自动生成，手动设置无效, 我们应该给脚本一个不组队的理由
if not self.组队模式 and self.totalnode_bak > 1: self.Tool.touchfile(self.无法进行组队FILE,"非组队模式 or nstep对战结束")
#................................................................................
# 选择对战线路和英雄
分路名称=["对抗", "打野","中路","发育","游走"]
线路坐标=[(-0.314, -0.26),  (-0.194, -0.26), (-0.069, -0.26), (0.037, -0.26),  (0.18, -0.26)]
位置坐标=[(6,5),(9,5),(4,4),(9,2),(2,4)]
index=(self.runstep+self.mynode)%len(分路名称)
TimeECHO(f"本次{self.runstep}对战分路: {分路名称[index]}")
#
#主战英雄
pos=位置坐标[index]
参战英雄头像坐标=(-0.54+pos[0]*0.09,-0.31+pos[1]*0.11)
self.Tool.cal_record_pos(参战英雄头像坐标, self.移动端.resolution, "参战英雄头像", savepos=True)
self.Tool.cal_record_pos(线路坐标[index], self.移动端.resolution, "参战英雄线路", savepos=True)
#备战英雄, 因为对抗、打野、游走之间的英雄会互相冲突, 所以这些位置冲突的时候换成其他路(发育3,中路2)
index=[3,2,3,2,3][index]
pos=位置坐标[index]
参战英雄头像坐标=(-0.54+pos[0]*0.09,-0.31+pos[1]*0.11)
self.Tool.cal_record_pos(参战英雄头像坐标, self.移动端.resolution, "备战英雄头像", savepos=True)
self.Tool.cal_record_pos(线路坐标[index], self.移动端.resolution, "备战英雄线路", savepos=True)
#................................................................................
# 礼包功能
#self.启动礼包功能 = self.mynode == 0
self.活动礼包 = True
self.祈愿礼包 = False
self.玉镖夺魁签到 = False
self.每日任务礼包=self.Tool.time_getweek() >= wzydday  # 战令末期不领取，前期周末领取 self.Tool.time_getweek() > 5
self.礼包功能_邮件礼包 = True
self.礼包功能_妲己礼物 = True
self.礼包功能_友情礼包 = True #self.Tool.time_getweek() < 3
self.友情礼包_积分夺宝 = True
self.友情礼包_皮肤碎片 = True
self.友情礼包_英雄碎片 = False
self.友情礼包_铭文碎片 = False
self.友情礼包_皮肤宝箱 = True
self.友情礼包_回城宝箱 = True
self.友情礼包_击败宝箱 = True
self.友情礼包_排位保护 = True
self.礼包功能_回忆礼册 = True
self.礼包功能_灵宝互动 = True
# 外置礼包，暂无手册，遇到问题，请自行调试，已从主程序分离，不再领取
self.外置礼包_王者营地 = False
self.外置礼包_体验服 = False
# 以下礼包不再第一时间维护，如果遇到问题，请自行调试
self.礼包功能_战队礼包 = False
self.礼包功能_商城礼包 = True
self.礼包功能_KPL礼包 = True
```


## 我在使用的`WZRY.1.运行模式.txt`
同`WZRY.0.运行模式.txt`
```
#cmd, 管理员建立软连接
mklink  WZRY.1.运行模式.txt WZRY.0.运行模式.txt
```


## 特殊用法的控制文件
### 组队刷友情币
```
# >>> 临时刷友情币
uptime = 12.0
self.对战时间=[0.1,uptime]
self.标准模式 = False
self.组队模式 = self.青铜段位 = True
self.触摸对战 = self.jinristep <= 5
if self.jinristep > 50: self.对战时间[1] = 1.2
self.启动礼包功能=False
# <<<
```