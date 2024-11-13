## 说明
* 该页面是介绍我的使用经验,不是教程
* 随着软件更新,这些经验可能不再适用
* 谨慎阅读

## windows计划任务
在代码目录创建`run.bat`,内容为
```
%USERPROFILE%\AppData\Local\anaconda3\python.exe wzry.py config.win.yaml
```

![windows计划任务启动脚本刷王者荣耀日常任务](../fig/crontab_win.png)


## linux计划任务
在代码目录创建`run.sh`, 使用`crontab -e`创建计划任务

```
51 4 * * * /usr/lib/android-sdk/platform-tools/adb kill-server
0  5 * * * cd /home/cndaqiang/soft/WZRY-2.2.3 && /usr/bin/python3 wzry.py ./config.lin.yaml  > result.txt 2>&1
50 11 * * *  pkill -f 'wzry.py'
```

## [测试]本脚本自带了每天定时刷任务的功能
* 使用脚本自带的循环功能, 把下面内容填到`WZRY.mynode.运行模式.txt`

```
self.内置循环=True
#每日自动对战时间范围
self.对战时间=[5,17]
```
