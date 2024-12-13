# 类吸血鬼游戏开发学习记录
学习视频教学《Create a Complete 2D Survivors Style Game in Godot 4》，记录点滴，备份文档。

## 版本更新

### V0.0.53 2024.12.13

* 制作升级卡动画。
* 美化暂停背景。
* 美化经验条。
* 美化结束界面。
* 美化按钮。
* 添加一种新的升级“移动速度+”，可以提升玩家的移动速度。

### V0.0.48 2024.12.12

* 美化升级卡UI。

### V0.0.46 2024.12.11

* 添加了两种升级：“投斧 伤害+”，“剑 伤害+”，可以提升两种能力的威力。
* 由于升级会造成浮点数产生，在显示伤害时会出现小数，现限制显示小数后一位，后续可能会添加按钮来让玩家决定是否显示小数。（莫名其妙想到了怪猎荒野）
* 重做升级池，现在改为使用版本v0.0.40制作的权重表，将来更好地添加新的能力。

### V0.0.45 2024.12.10

* 添加了伤害数字显示。
* 添加了命中怪物的特效：闪白。
* 修改了字体，为了适配中文，使用字体VonwaonBitmap。
* 将所有文本汉化。
* 调整了字体显示大小和位置。

### V0.0.43 2024.12.4

* 应用了新的字体Rockboxcond12（来自[Nb Pixel Font Bundle](https://nimblebeastscollective.itch.io/nb-pixel-font-bundle)），美化UI倒计时。

### V0.0.42 2024.12.3

* 为巫师制作了简易普通动画。
* 网站https://easings.net/可以帮助我们快速找到需要的easing function（缓动函数），缓动函数是参数随时间变化的速率函数。
* 为拾取经验瓶制作拾取动画，应用缓动函数easeInBack，效果为，拾取到经验瓶会先被弹开一小段，然后加速向玩家移动，也是绝大多数游戏在拾取动画中使用的缓动函数。添加scale让经验瓶会变小消失而不是瞬间消失。
* **未制作**：一种移动方式“拖动”：类似于史莱姆，加速向前行走一段然后减速停下，再向前走。
* **未制作**：经验瓶拾取动画“旋转”：经验瓶在拾取的过程中会朝玩家方向旋转，像导弹一样，个人认为这样的动画应该做给导弹。

### V0.0.40 2024.12.2

* 添加了权重表，可以对游戏里的物品，敌人等添加权重，以便于控制掉落率，生成等。
* 现在当难度提升到6（游戏进行30秒时），巫师会加入战场，生成概率为66.7%，鼠鼠生成概率降低至33.3%。
* 目前巫师拥有更高的血量，其特点还有待制作。

### V0.0.39 2024.11.28

* 修改了怪物的移动属性，添加了“加速度”，现在可以设置怪物的加速度，可以让怪物追踪玩家变得灵活/迟钝。
* 添加了新的怪物“巫师”。

### V0.0.38 2024.11.27

* 制作了怪物的死亡动画，普通动画，现在怪物死亡时会产生动画。

### V0.0.36 2024.11.26

* 将新能力斧头添加进升级池，添加相关描述。
* 添加能力升级上限，每个能力的升级次数达到上限后将不会出现。
* 添加人物行走动画和相关逻辑。

### V0.0.33 2024.11.25

* 制作了新能力——斧头：生成一个半径逐渐扩大的旋转斧头，攻击接触到的所有敌人。

### V0.0.32 2024.11.22

* 优化了怪物生成逻辑，怪物不会生成在地图之外。

### V0.0.31 2024.11.21

* 制作了游戏失败UI，其实是将胜利和失败都整合到了EndingUI，失败时显示的画面有所改变。
* 添加了难度组件，游戏难度会随时间递增，一些怪物的生成，生成速度，属性会随难度等级提高。
* 制作了地图边界。

### V0.0.28 2024.11.20

* 添加了玩家血条。
* 制作了游戏胜利UI，包含重新开始按钮和退出按钮。

### V0.0.26 2024.11.19

* 添加了玩家的血量和受伤逻辑，现在玩家可以被怪物杀死，受到伤害后有0.5秒的无敌时间。

### v0.0.25 2024.11.18

* 添加了升级能力“sword_rate”，可以增加剑的生成速度（10%）。
* 优化了图层显示，现在怪物和掉落物高于角色Y轴会在角色图层之下，低于Y轴会在角色图层之上，技能特效均在角色和怪物之上。

### v0.0.23 2024.09.25

* 添加了升级UI：提升等级时会暂停游戏并出现升级UI，将来可供选择升级。

### v0.0.21 2024.09.10

* 添加了升级模块：提升等级时会随机触发一种升级，在将来可以进行选择。
* 添加了能力管理模块：用于管理武器能力的ID，效果，描述。

### v0.0.20 2024.09.09
* 添加了经验条：显示当前等级的经验进度
* 初步建立了经验-等级框架，现在拾取的经验能有效地记录，并且达到等级需求的经验会触发升级

### v0.0.19 2024.09.04
* 添加了攻击盒组件：用于管理武器能力击中敌人（受击盒）产生的效果
* 添加了受击盒组件：用于管理敌人被武器能力（攻击盒）击中时产生的效果
* 现在武器能力击中敌人能产生一定的伤害，使得敌人的血量减少

### v0.0.18 2024.09.03
* 添加了经验掉落组件：现在击杀怪物可以掉落经验值
* 添加了血量组件： 现在怪物和人物可以拥有血量
* 添加了经验掉落率： 怪物掉落经验可以设置为一个概率值