## 说明
若需调整第`mynode`个账户，循环选择对战分路，并选择熟练度最低的英雄

* 则在`wzry.py`所在的文件夹，创建`WZRY.mynode.对战前插入.txt`文件
* **把`mynode`替换为你的账户编号**
* 文件为UTF8格式编码, 内容为标准的python语法，不支持超过一行的python语句。

在文件内部填入
```
字典位置文件=[]
字典位置文件.append("字典.中路.android.var_dict_N.yaml")
字典位置文件.append("字典.打野.android.var_dict_N.yaml")
字典位置文件.append("字典.发育.android.var_dict_N.yaml")
字典位置文件.append("字典.游走.android.var_dict_N.yaml")
字典位置文件.append("字典.对抗.android.var_dict_N.yaml")
此步位置文件=(self.runstep+self.mynode)%len(字典位置文件)
TimeECHO(f"本步{self.runstep}使用字典文件{字典位置文件[此步位置文件]}")
dictfile=self.Tool.read_dict(字典位置文件[此步位置文件])
for key in ["参战英雄线路","参战英雄头像"]: self.Tool.var_dict[key]=dictfile[key]
```

我提前录制了960x540分辨率的字典文件，[字典.分路.android.var_dict_N.zip](/wzry.doc/file/字典.分路.android.var_dict_N.zip)。解压在脚本目录
![](/wzry.doc/fig/shuliandu.png)

!!! Note
    我提供的字典文件[字典.分路.android.var_dict_N.zip](/wzry.doc/file/字典.分路.android.var_dict_N.zip)并不会实时更新，
    当出现新英雄时，该字典不会选择新英雄。
    如果你的分辨率不是960x540也不要使用这个字典。
    这两种情况你应该生成自己的字典文件，并将"字典.分路.android.var_dict_N.yaml"中的坐标，替换为你的模拟器的坐标。
    仅需替换`参战英雄头像`和`参战英雄线路`

```
参战英雄头像: !!python/tuple
- 764
- 291
参战英雄线路: !!python/tuple
- 655
- 25
```

## 生成字典的方法
在选择英雄界面，使用AirtestIDE截取新英雄头像的中心位置，可以得到这样一串代码
```
Template(r"tpl1689665490071.png", record_pos=(-0.315, -0.257), resolution=(960, 540))
```

根据我的经验，新英雄的位置就是
```
参战英雄头像: !!python/tuple
- 0.5*960+(-0.315*960)
- 0.5*540+(-0.257*960)
```
新分路的位置同理。


我也将该规则集成到了airtest_mobileauto的模块当中
```python
    def cal_record_pos(self, record_pos=(0.5, 0.5), resolution=(960, 540), keystr="", savepos=False):
        x = 0.5*resolution[0]+record_pos[0]*resolution[0]
        y = 0.5*resolution[1]+record_pos[1]*resolution[0]
        pos = (x, y)
        if savepos and len(keystr) > 0:
            self.var_dict[keystr] = pos
            self.save_dict(self.var_dict, self.var_dict_file)
        return pos
```

!!! tip
    如果是960x540的设备，出现新英雄时，不想使用AirtestIDE，修改一下"字典.分路.android.var_dict_N.yaml"其中的英雄坐标即可，把横向的数字加大一些试试就出来了。
    