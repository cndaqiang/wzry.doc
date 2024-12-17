## 说明
* [autowzry](https://pypi.org/project/autowzry/)是[WZRY](https://github.com/cndaqiang/WZRY)的可执行版本.
* [autowzry](https://pypi.org/project/autowzry/)通过pip安装, 包含程序`autowzry.exe`等.

## 安装模拟器和登陆游戏
同[安装模拟器和登陆游戏](../guide/install.md)

## 安装autoWZRY

```
python -m pip install autowzry --upgrade
# 等价于下载WZRY的release代码
```

## 运行
* 创建[配置文件:config.win.yaml](../guide/config.md)
* 可选[控制文件](../guide/file.md)
* 可选[更新资源](../guide/upfig.md)
* 注意**配置文件`config.win.yaml`,控制文件`WZRY.mynode.运行模式.txt`,图片更新`WZRY.图片更新.txt`都是放在运行目录**不是放到代码目录


### 运行autowzry
```
autowzry config.win.yaml
# 等价于 python wzry.py config.win.yaml
```
![autowzry](../fig/autowzry.png)


体验服和营地礼包也可以独立运行
```
autowzyd config.win.yaml
# 等价于 python wzyd.py config.win.yaml
#
autotiyanfu config.win.yaml
# 等价于 python tiyanfu.py config.win.yaml
```

## 计划任务
`crontab -e`

```
#crontab支持path
PATH=/home/cndaqiang/.local/bin:/usr/lib/jvm/java-11-openjdk-arm64/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
0 5 * * * cd /home/cndaqiang/soft/autowzry && autowzry config.lin.yaml > result.txt 2>&1
50 11 * * *  pkill -f 'autowzry'
```