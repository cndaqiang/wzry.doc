## WZRY
[WZRY](https://github.com/cndaqiang/WZRY)是基于[airtest-mobileauto](https://github.com/cndaqiang/airtest_mobileauto)开发的王者荣耀农活自动化脚本. 

![GitHub forks](https://img.shields.io/github/forks/cndaqiang/WZRY?color=60c5ba&style=for-the-badge)
![GitHub stars](https://img.shields.io/github/stars/cndaqiang/WZRY?color=ffd700&style=for-the-badge)


## 自动化

* 开启关闭模拟器、容器、手机
* 真正的无人值守：自动对战，自动领取礼包
* 检测游戏闪退、模拟器关闭等错误，自动重启模拟器及软件进行修正
* 健康系统自动休息启动
* 自动切换熟练度，优先星耀人机模式，次数达到上限后切换青铜人机
* 自动调整分路并选择熟练度最低的英雄

## 对战模式

5v5人机单人模式、组队模式、标准模式、快速模式、星耀难度、青铜难度

- 挂机模式: 适合完成每日任务、战令任务、**提高熟练度**,
- TOUCH模式(移动+平A): 适合完成活动的**标准对战非挂机**对战要求

王者模拟战单人模式、组队模式

- 刷信誉分专用, 每日上限+5分. 
- 战令的每期任务: 20场娱乐模式, 可以用模拟战刷齐



## 礼包功能

* 友情对战: 友情币领取、奖励兑换
* 邮件礼包: 好友邮件、系统邮件
* 妲己一键领奖
* 战令礼包、战令任务礼包
* 回忆礼册
* 祈愿页面领取祈愿币、玉镖夺魁的飞镖
* [停止更新]KPL观赛战令观赛领取经验升级
* [停止更新]战队商店领取英雄碎片
* [停止更新]商城每日免费钻石碎片随机礼包


## 王者营地和体验服
`wzry.py`支持领取相同虚拟机内部的王者营地礼包和体验币

王者营地: 体验服兑换碎片礼包、每日签到、每日任务、营地币每周兑换英雄碎片、战令经验
!!! note
    营地的不同版本界面有差异、QQ微信登录的界面也有差异, 个别礼包可能无法识别完成

更新体验服，领取体验币
!!! Warning
    在Root的安卓上登录体验服，会被封号，与本脚本无关。如使用体验服的功能，请关闭模拟器的Root选项


王者营地礼包和体验服更新也可以独立启动、不依赖于wzry.py

* `python -u wzyd.py config.ce.yaml`
* `python -u tiyanfu.py config.ce.yaml`


## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=cndaqiang/WZRY&type=Date)](https://star-history.com/#cndaqiang/WZRY&Date)
