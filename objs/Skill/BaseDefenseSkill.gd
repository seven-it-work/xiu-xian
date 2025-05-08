extends Skill
class_name BaseDefenseSkill

func _init() -> void:
	self.desc="获取当前防御值的护甲"
	self.name_str="普通防御"
	pass

func use(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	# 对自己施加特效
	var an:AnimatedSprite2D=preload("uid://cp13s6jfkvcex").instantiate()
	user.add_child(an)
	# 获取父节点(user)的矩形大小
	var parent_rect = user.get_rect()
	# 设置精灵位置为父节点中心
	an.position = parent_rect.size / 2
	AnimationUtils.set_sprite_size(an,user.size.x,user.size.x)
	an.play()
	await an.animation_finished
	an.visible=false
	an.queue_free()
	var shield=user.people.def.get_current()
	user.people.shield.add_current(shield)
	pass
