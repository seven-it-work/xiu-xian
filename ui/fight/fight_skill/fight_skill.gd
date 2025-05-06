extends Control

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
	var fightUi=get_node("/root/Main")
	fightUi.add_child(specialEffectNode)
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

func _on_attack_button_pressed() -> void:
	## 随机选择一个敌人
	var enemy=all_target_list.pick_random()
	var l=Label.new()
	l.text="攻击"
	await skillSpecialEffects(l,user,enemy)
	pass # Replace with function body.
