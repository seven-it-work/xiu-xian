## 使用ai从零开发 修仙文字游戏

## 设计

### 对象设计

#### 通用对象
name_str:String
atk:float
def:float
hp:float


### 页面设计

#### 战斗页面

玩家与怪物战斗：
伤害计算公式如下：
var damage=maxf(攻击者.atk-防御者.def,1)
防御者.hp-=damage