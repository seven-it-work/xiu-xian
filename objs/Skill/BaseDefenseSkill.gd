extends Skill

func _ready() -> void:
	self.desc="获取当前防御值的护甲"
	self.name_str="普通防御"
	pass

func use(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	# todo 对自己施加特效
	var shield=user.people.def.get_current()
	user.people.shield.add_current(shield)
	pass