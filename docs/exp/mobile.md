## 说明
* 该页面是介绍我的使用经验,不是教程
* 随着软件更新,这些经验可能不再适用
* 谨慎阅读
* 原则上所有`16:9`屏幕比例的安卓设备都可以使用本脚本(`960:540=16:9`)
* 即使你的手机屏幕比例不是16:9,大多数的功能还是可以使用的.
* 设置好`LINK_dict`后, 就可以运行本脚本查看效果了
* **注意, 但凡分辨率不是`960x540`,dpi不是`160`的模拟器, 遇到任何问题都请独立解决.**

## WIFI控制手机示例

**手机打开ADB无线配对,电脑adb连接**
![image](https://github.com/cndaqiang/AirTest_MobileAuto_WZRY/assets/26620270/879d20d4-5d6a-4397-9809-b63cf2b488b7)

```
(base) cndaqiang@macmini ~$ adb pair 192.168.12.109:39833
Enter pairing code: 527695
Successfully paired to 192.168.12.109:39833 [guid=adb-4e86ac13-GhtB4l]
#注意配对端口和连接端口不一样
(base) cndaqiang@macmini ~$ adb connect 192.168.12.109:41857
connected to 192.168.12.109:41857
```

配置文件
```
mynode: 0
LINK_dict:
  0: Android:///192.168.12.109:41857
```


## USB控制手机示例
![adbdevice](../fig/adbdevice.png)


配置文件
```
mynode: 0
LINK_dict:
  0: Android:///4e86ac13
```
