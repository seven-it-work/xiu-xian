extends Node
class_name Skill

@export var name_str:String=""
@export var desc:String=""
@export var react_path:String=""

## 消耗
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


func getSpecialEffectNode()->Node:
	if StrUtils.is_blank(react_path):
		var l=Label.new()
		l.text=name_str
		return l
	var t=TextureRect.new()
	t.texture=load(react_path)
	return t;

func use(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	print("由子类实现")
	pass

#region 动画方法库

# 攻击过程，子弹特性
func skillSpecialEffects(specialEffectNode:Node,start_node:Node,end_node:Node):
	specialEffectNode.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	var mainUi=specialEffectNode.get_node("/root/Main")
	mainUi.add_child(specialEffectNode)
	var tween = create_tween()
	specialEffectNode.position.x=start_node.global_position.x+randf_range(0,start_node.size.x-specialEffectNode.size.x)
	specialEffectNode.position.y=start_node.global_position.y+start_node.size.y/2
	var end_position=Vector2(
		end_node.global_position.x+randf_range(0,end_node.size.x-specialEffectNode.size.x),
		end_node.global_position.y+end_node.size.y/2
	)
	tween.tween_property(
		specialEffectNode,                # 目标对象
		"position",    # 要动画的属性
		end_position,  # 目标位置
		0.5                  # 动画时长（秒）
	).set_ease(Tween.EASE_IN)
	# 动画结束后删除 Label
	await tween.finished
	specialEffectNode.queue_free()
	AnimationUtils.start_shake(self,end_node)
	AnimationUtils.transition_border_color(end_node,Color.RED,Color(0.8, 0.8, 0.8))
	AnimationUtils.transition_background_color(end_node,Color(1, 0.8, 0.8) ,Color(0.6, 0.6, 0.6))
	pass
#endregion
