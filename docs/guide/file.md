## 说明
* 本脚本会优先进行星耀快速对战, 再星耀达到上限后自动转为青铜模式, 并持续对战到凌晨.
* 如果希望**精细的操作[运行时间](#控制运行时间示例)、[对战模式](duizhanmoshi.md)、[选择英雄](shuliandu.md)、[礼包功能](libao.md)等**
* 可以创建`WZRY.mynode.运行模式.txt`文件调控第`mynode`账户的功能
* **把`mynode`替换为你的[账户编号](config.md#mynode与instance的区别)**
* `WZRY.mynode.运行模式.txt`为UTF8格式编码, 内容为标准的python语法,不支持超过一行的python语句.
* 王者因为活动**临时更改**对战按钮等图片资源, 可以创建`WZRY.图片更新.txt`文件来[更新资源](../guide/upfig.md).

## 控制运行时间示例
mynode=0的账户，仅在每天的5点到17点执行脚本,在`WZRY.0.运行模式.txt`中添加
```
self.对战时间=[5,17]
```
![WZRY.mynode.运行模式.txt示意截图](../fig/linshi.png)


每天只对战5局,则在`WZRY.mynode.运行模式.txt` 中填写
```
if self.jinristep >  5:  self.对战时间[0]=0.1
if self.jinristep >  5:  self.对战时间[1]=0.2
```

## 其他功能
* [对战模式](../guide/duizhanmoshi.md)
* [选择英雄](../guide/shuliandu.md)
* [礼包功能](../guide/libao.md)
* [更新资源](../guide/upfig.md)

