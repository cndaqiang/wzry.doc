# 在甲骨文免费服务器上安装redroid并配置WZRY
## 说明
* 该页面是介绍我的使用经验,不是教程
* 随着软件更新,这些经验可能不再适用
* 谨慎阅读


## 安装redroid
```
# 有墙, 从镜像站拉取最新的redroid容器，寻找适合自己的镜像站
docker pull dockerhub.anzu.vip/redroid/redroid:15.0.0_64only-latest
#
# 创建容器
cndaqiang@oracle:~$ N=0;port=5555
cndaqiang@oracle:~$ docker run -itd  --privileged \
        -p $port:5555 \
        --name androidcontain$N \
        dockerhub.anzu.vip/redroid/redroid:15.0.0_64only-latest \
        androidboot.redroid_width=960 \
        androidboot.redroid_height=540 \
        androidboot.redroid_dpi=160 \
        androidboot.hardware=WLZ-AN00 ro.secure=0 ro.boot.hwc=GLOBAL    \
        ro.ril.oem.imei=861503068361$((100 + $RANDOM % 900)) ro.ril.oem.imei1=861503068361$((100 + $RANDOM % 900))  \
        ro.ril.oem.imei2=861503068361$((100 + $RANDOM % 900)) ro.ril.miui.imei0=861503068361$((100 + $RANDOM % 900)) \
        ro.product.manufacturer=HUAWEI ro.build.product=chopin \
        androidboot.redroid_fps=10 \
        redroid.gpu.mode=guest
```


### 连接redroid

使用Escrcpy连接redroid
![](../fig/redroid.lin.png)

## 安装王者荣耀
从[https://pvp.qq.com/](https://pvp.qq.com/)获得下载连接
```
cndaqiang@oracle:~$ wget "https://dlied4.myapp.com/myapp/1104466820/cos.release-40109/10040714_com.tencent.tmgp.sgame_a3374327_10.1.1.6_VlRaes.apk"
cndaqiang@oracle:~$ adb connect 127.0.0.1:5555
connected to 127.0.0.1:5555
cndaqiang@oracle:~$ adb -s 127.0.0.1:5555 install 10040714_com.tencent.tmgp.sgame_a3374327_10.1.1.6_VlRaes.apk 
```

极简更新>登录>进入大厅>

* 更新资源
* 设置游戏画质最低
* 手动进入一次人机房间
* 手动进入一次战令页面
* 手动进入一次模拟战房间
* 返回大厅

## 多开设置
重复上面的操作,创建第二个redroid容器
```
cndaqiang@oracle:~$ N=1;port=5565
.......
```

## 配置WZRY
下载
```
cndaqiang@oracle:~/soft$ wget https://github.com/cndaqiang/WZRY/archive/refs/tags/2.2.3.zip
cndaqiang@oracle:~/soft$ unzip -x 2.2.3.zip 
cndaqiang@oracle:~/soft$ cd WZRY-2.2.3
```

创建[docker参数](../guide/config.md#docker参数)`vi config.lin.yaml`
```
# 节点配置
totalnode: 2
multiprocessing: True
LINK_dict:
    0: "Android:///127.0.0.1:5555"
    1: "Android:///127.0.0.1:5565"
dockercontain:
    0: "androidcontain0"
    1: "androidcontain1"
logfile:
    0: result.0.txt
    1: result.1.txt
```

创建控制文件`vi WZRY.0.运行模式.txt;ln -s  WZRY.0.运行模式.txt WZRY.1.运行模式.txt`
```
#................................................................................
uptime=23.9
self.对战时间=[5.0,uptime]
self.限时组队时间=uptime
#................................................................................
#每天组队打0,1,2,...,nstep-1共nstep场，组队5v5匹配
#每天组队打0,1,2,...,ostep-1共ostep场，单人5v5匹配|模拟战
nstep=3
ostep=3 if self.mynode == 0 else 1 # 为了获得更多的经验，可以将 ostep 设为模拟战 或者 0。
self.对战模式="5v5匹配" if self.jinristep <=  nstep else "模拟战"
# 组队模式
self.组队模式 = self.组队模式 and self.jinristep <= nstep
if not self.组队模式: self.Tool.touchfile(self.无法进行组队FILE)
#................................................................................
# 结束游戏的判定
endgame = self.jinristep >=  nstep+ostep
if self.jinristep <= nstep and not self.组队模式 and self.totalnode_bak > 1: endgame = True
if os.path.exists(self.青铜段位FILE): endgame = True # 只刷星耀局
if endgame: self.对战时间[1]=self.对战时间[0]+0.1
#................................................................................
# 对战模式设置
# 每天早上前一局，标准模式
self.标准模式 = self.触摸对战 = False
if self.组队模式 and self.jinristep <= 1: self.标准模式 = self.触摸对战 = True
# 组队的时候不要赢，这样获得的战令经验不到上限，可以额外从营地领经验
if self.组队模式 and self.Tool.time_getweek() <= 5: self.触摸对战 = True
if self.组队模式: self.青铜段位 = os.path.exists(self.青铜段位FILE) or self.触摸对战
#................................................................................
# 选择对战线路和英雄
分路名称=["对抗", "打野","中路","发育","游走"]
index=(self.runstep+self.mynode)%len(分路名称)
TimeECHO(f"本次{self.runstep}对战分路: {分路名称[index]}")
#
# 第(列,行)的英雄位置
pos=[(6,5),(9,5),(4,4),(9,2),(2,4)][index]
参战英雄头像坐标=(-0.54+pos[0]*0.09,-0.31+pos[1]*0.11)
参战英雄线路坐标=[(-0.314, -0.26),  (-0.194, -0.26), (-0.069, -0.26), (0.037, -0.26),  (0.18, -0.26)][index]
self.Tool.cal_record_pos(参战英雄头像坐标, self.移动端.resolution, "参战英雄头像", savepos=True)
self.Tool.cal_record_pos(参战英雄线路坐标, self.移动端.resolution, "参战英雄线路", savepos=True)
#................................................................................
# 礼包功能
self.启动礼包功能 = self.mynode == 0
self.活动礼包 = False
self.祈愿礼包 = False
self.玉镖夺魁签到 = False
self.每日任务礼包=self.Tool.time_getweek() > 5  # 战令末期不领取，前期周末领取 self.Tool.time_getweek() > 5
self.礼包功能_邮件礼包 = False
self.礼包功能_妲己礼物 = True
self.礼包功能_友情礼包 = self.Tool.time_getweek() < 3
self.友情礼包_积分夺宝 = True
self.友情礼包_皮肤碎片 = True
self.友情礼包_英雄碎片 = False
self.友情礼包_铭文碎片 = False
self.友情礼包_皮肤宝箱 = True
self.友情礼包_回城宝箱 = True
self.友情礼包_击败宝箱 = True
# 外置礼包，暂无手册，遇到问题，请自行调试，已从主程序分离，不再领取
self.外置礼包_王者营地 = False
self.外置礼包_体验服 = False
# 以下礼包不再维护，如果遇到问题，请自行调试
self.礼包功能_战队礼包 = False
self.礼包功能_商城礼包 = False
self.礼包功能_KPL礼包 = False
```

## 个性化配置
### 今日仍在周年庆需要更新
从[更新资源](../guide/upfig.md)获得更新资源
```
cndaqiang@oracle:~/soft/WZRY-2.2.3$ wget https://wzry-doc.pages.dev/file/2017-12-11-update/update.zip
cndaqiang@oracle:~/soft/WZRY-2.2.3$ unzip -x update.zip
```

### 更新房主头像
代码里面就是我的头像,所以我不用更新

## 运行WZRY
```
# 更新依赖
cndaqiang@oracle:~/soft/WZRY-2.2.3$ python3 -m pip install airtest_mobileauto --upgrade
# 运行
cndaqiang@oracle:~/soft/WZRY-2.2.3$ python3 wzry.py ./config.lin.yaml 
```

运行成功截图
![](../fig/redroid.run.png)


## 配置开机自启

```
cndaqiang@oracle:~/soft/WZRY-2.2.3$ touch WZRY.oneday.txt
cndaqiang@oracle:~/soft/WZRY-2.2.3$ crontab -e
```

计划任务内容
```
51 4 * * * /usr/lib/android-sdk/platform-tools/adb kill-server
0 5 * * * cd /home/cndaqiang/soft/WZRY-2.2.3 && /usr/bin/python3 ./config.lin.yaml  > result.txt 2>&1
50 11 * * *  pkill -f 'wzry.py'
```