## 说明
* 请在**会使用WZRY后**, 再尝试阅读本页文档(Python老手可以直接阅读)
* [AutoWZRY](https://pypi.org/project/AutoWZRY/)是[WZRY](https://github.com/cndaqiang/WZRY)的模块版
* [AutoWZRY](https://pypi.org/project/AutoWZRY/)的使用方法和原版的[WZRY](https://github.com/cndaqiang/WZRY)基本相同
* [AutoWZRY](https://pypi.org/project/AutoWZRY/)可以**在任意目录通过`autowzry.exe config.win.yaml`执行**

## 安装安装模拟器和登陆游戏
同[安装模拟器和登陆游戏](../guide/install.md)

## 安装autoWZRY

```
python -m pip install  -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple  autoWZRY --upgrade
```

## 运行
* 创建[配置文件:config.win.yaml](../guide/config.md)
* 可选[控制文件](../guide/file.md)
* 可选[更新资源](../guide/upfig.md)

运行autowzry
```
#windows
autowzry.exe config.win.yaml
#linux
autowzry .config.lin.yaml
```

![autowzry](../fig/autowzry.png)

体验服和营地礼包也可以独立运行
```
autowzyd.exe config.win.yaml
autotiyanfu.exe config.win.yaml
```