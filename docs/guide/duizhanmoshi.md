## 说明
若需调整第`mynode`个账户的对战模式

* 则在`wzry.py`所在的文件夹,创建`WZRY.mynode.运行模式.txt`文件
* **把`mynode`替换为你的[账户编号](config.md#mynode与instance的区别)**
* 文件为UTF8格式编码, 内容为标准的python语法,不支持超过一行的python语句.
!!! info "目前支持的对战模式包括"
    <pre><code>
    self.青铜段位 = False # True 则进行青铜人机,False进行星耀人机
    self.标准模式 = False # True 则进行标准人机,False进行快速人机
    self.触摸对战 = False # True 则在对战过程自动平移、平A、买装备等真人的操作.
    self.对战模式 = "5v5匹配" # 目前支持 "5v5匹配"(人机5v5), "模拟战"(王者模拟战)
    self.组队模式 = True # 是否进行组队, totalnode > 1时默认组队.
    </code></pre>


### 根据对局次数选择对战模式
* `self.runstep`,本脚本累计运行了多少次对战
* `self.jinristep`,本脚本此次运行了多少次对战

示例前2局标准对战并移动, 在`WZRY.mynode.运行模式.txt` 中填写
```
self.标准模式 = self.触摸对战 = False
if self.jinristep <= 2: self.标准模式 = self.触摸对战 = True
```