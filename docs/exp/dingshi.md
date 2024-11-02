## 说明
* 该页面是介绍我的使用经验,不是教程
* 随着软件更新,这些经验可能不再适用
* 谨慎阅读

## [通用]本脚本自带了每天定时刷任务的功能
只要程序不退出,脚本会自动刷任务,把下面内容填到`WZRY.mynode.临时初始化.txt`
```
#每日自动对战时间范围
self.对战时间=[5,17]
#组队的时间限制
self.限时组队时间=12
```

## windows计划任务
在代码目录创建`wzry.oneday.txt`, 以及`run.bat`,内容为
```
%USERPROFILE%\AppData\Local\anaconda3\python.exe wzry.py config.win.yaml
```

![](../fig/crontab_win.png)


## linux计划任务
在代码目录创建`wzry.oneday.txt`, 以及`run.sh`,内容为

```
50 4 * * * pkill -f 'wzry.py'
51 4 * * * /usr/lib/android-sdk/platform-tools/adb kill-server
0 5 * * * cd /home/cndaqiang/soft/WZRY && /bin/bash run.sh
50 8 * * 1-5 pkill -f 'wzry.py'
```

