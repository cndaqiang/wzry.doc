## 2025-01-18
* 破防停更.

## 2025-01-12 2.3.1a9
* 删除autowzry仓库, 使用github的action自动构建[autowzry@pypi](../exp/pypi.md)

## 2024-12-25 2.3.1
* 适配S38赛季

## 2024-12-13 2.3.0
* 与[autowzry@pypi](../exp/pypi.md)代码统一
* ios区日活代码、教程更新

## 2024-11-22 2.2.9
* 镜像代码到 [autowzry@pypi](../exp/pypi.md)
* 修复adb故障: 可以连接但是无法触摸
* 同步参数、优化礼包、对战

## 2024-11-16 2.2.8-stable
* 新增礼包: 灵宝、排位保护卡
* 礼包更新: KPL战令、战队、商城
* 代码重构: 登录游戏、进入大厅
* `airtest-mobileauto` 加速


## 2024-11-11 2.2.6-stable
* 架构微调: 保持代码目录清爽
* 精简控制方式. 仅保留唯一控制文件`WZRY.mynode.运行模式.txt`
* 优化登录、进房、组队流程.


## 2024-11-01 2.2.1
* 随着新战令release稳定包
* 根据`airtest-mobileauto`的新函数,优化`wzry.py`中的老旧代码.
* 强烈推荐升级. yaml文件yyds.

## 2024-10-30 2.2.0
* 与`airtest-mobileauto`同步升级,采用yaml文件配置运行参数以及坐标文件
* yaml为后期的自定义功能留下了无限的可能.
* 采用MkDocs重新生成[项目网站和使用手册](../index.md).



## 2024-10-24 2.1.11
* 新用户增多
* 累计删除了很多复杂的控制方法
* 更新用户手册,整理issues.

## 2024-10-13 2.0.14
* 将营地和体验服作为单独的模块更新.

## 2024-09-25 2.0.11
针对S37赛季的更新,进行了第一轮优化

* 回忆礼册领取流程更新
* 适配全新的结算动画

## 2024-08-19 2.0.4
* 增加体验服功能.自动更新体验服,并领取体验币.

## 2024-07-30 2.0.1
* 代码改动较大,版本号升级.
* airtest-mobileauto从项目中分离,采用pip的方式发布为独立的控制模块[airtest-mobileauto](https://pypi.org/project/airtest-mobileauto/).

## 2024-07-05 1.3.0.dev
* 包含大量新的代码, 进行了大量测试
* 优化了非常多的逻辑
* 代码更简洁、更稳定
* [airtest-mobileauto]重点优化了Windows平台BlueStack、LDPlayer模拟器的使用
* 累计更新包括,开放了自动选择熟练度等功能.

## 2024-06-27 1.2.0
* 适配S36赛季：对战入口、商城界面
* 彻底删除六国远征等代码
* [airtest-mobileauto]将APP的打开关闭等操作从设备管理中独立出来
* 累计更新包括,格式化输出,PID矫正冲突,大量营地和主程序的优化.

## 2024-02-13 1.1.0-CNY
* 农历新年版本
* 营地功能已成熟
* 大量细节优化,图片加速
* 将图片、运行状态等独立为单独的类.

## 2023-12-31 NewYear-1.0
* 全面测试稳定版本
* airtest-mobileauto已趋于成熟.完美支持`win/mac/lin`平台和`android/ios`系统

## 2023-12-27 v0.4
* 新增六国远征、武道大会.
* 自动点击速刷模拟战.

## 2023-11-16 first version
* 第一个**面向对象**版本, 此时wzry和airtest-mobileauto还是共用一个仓库.
* 兼通模拟器、安卓手机、容器、ios设备管理


## 2023-04-20 历史发展
* 本脚本初期大量参考了[WZRY_AirtestIDE@XRSec](https://github.com/XRSec/WZRY_AirtestIDE)项目,并适配了我的[小米11](https://github.com/cndaqiang/WZRY_AirtestIDE_XiaoMi11).
* 随后移植到了Bluestack模拟器上[WZRY_AirtestIDE_emulator@cndaqiang](https://github.com/cndaqiang/WZRY_AirtestIDE_emulator)
* 优化[WZRY_AirtestIDE_emulator@cndaqiang](https://github.com/cndaqiang/WZRY_AirtestIDE_emulator)适配docker容器[redroid](https://hub.docker.com/r/redroid/redroid),实现了7*24小时服务器在线刷日活.