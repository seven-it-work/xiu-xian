extends Node
class_name Skill

enum Skill_Type{
	None,
	Attack,
	Def,
}

@export var id:String=""
@export var name_str:String=""
@export var desc:String=""
@export var skill_type:Skill_Type=Skill_Type.None

# 敌人过滤条件
@export var select_condition:BaseCondition=RandomSelectCondition.new()
# 目标
@export var target_condition:BaseCondition=Self.new()
# 数量
@export var target_size:int=1
# 动作
@export var action:BaseSkillAction
# 持续回合(0表示当前回合，1表示下个回合就失效了)
@export var continuous_round:int=0;

# 动画节点路径（类似子弹这种）
@export var react_path:String=""

## 基础灵力消耗
@export var cost:Property=Property.buildByJsonStr("""
{
	"filename": "res://objs/Property/Property.gd",
	"name_str": "消耗",
	"current_value": 0.0,
	"min_v": 0.0,
	"max_v": 0.0,
	"growth_min": 0.0,
	"growth_max": 0.0,
	"growth_factor": 0.0,
	"grow_value": 0.0,
	"growth_times": 0,
	"data_type": 0
}
""")

## 计算灵力消耗（更具技能强度来算）
# 公式如下：
func get_real_cost():
	pass

func getSpecialEffectNode()->Node:
	if StrUtils.is_blank(react_path):
		var l=Label.new()
		l.text=name_str
		return l
	var t=TextureRect.new()
	t.texture=load(react_path)
	return t;

func use(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	var target_list=target_condition.start_filter(user,all_friendly_list,all_target_list)
	target_list= select_condition.filter_china(target_list,self.target_size)
	if action:
		await action.do_action(self,user,target_list)
	pass
