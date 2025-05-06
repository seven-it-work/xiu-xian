extends PanelContainer

var all_target_list:Array=[]
var all_friendly_list:Array=[]
var user:FightPeopleNode

func init(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	self.all_target_list=all_target_list
	self.all_friendly_list=all_friendly_list
	self.user=user
	pass

func skillSpecialEffects(specialEffectNode:Node,start_node:Node,end_node:Node):
	specialEffectNode.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	add_child(specialEffectNode)
	var tween = create_tween()
	specialEffectNode.position.x=start_node.global_position.x+randf_range(0,start_node.size.x-specialEffectNode.size.x)
	specialEffectNode.position.y=start_node.global_position.y
	var end_position=Vector2(
		end_node.global_position.x+randf_range(0,end_node.size.x-specialEffectNode.size.x),
		end_node.global_position.y+50
	)
	tween.tween_property(
		specialEffectNode,                # 目标对象
		"position",    # 要动画的属性
		end_position,  # 目标位置
		1                  # 动画时长（秒）
	).set_ease(Tween.EASE_IN)
	# 动画结束后删除 Label
	await tween.finished
	#技能特效tween_callback(end_node,特效node)
	pass

func _on_attack_button_pressed() -> void:
	## 随机选择一个敌人
	var enemy=all_target_list.pick_random()
	var l=Label.new()
	l.text="攻击"
	await skillSpecialEffects(l,user,enemy)
	pass # Replace with function body.
