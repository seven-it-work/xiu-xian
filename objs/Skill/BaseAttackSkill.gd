extends Skill
class_name BaseAttackSkill

func _ready() -> void:
	self.desc="随机对一个敌人造成普通攻击伤害"
	self.name_str="普通攻击"
	pass

func use(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	var target=all_friendly_list.pick_random()
	# 播放动画
	await skillSpecialEffects(getSpecialEffectNode(),user,target)
	var damage=user.people.atk.get_current()
	# 伤害计算
	target.people.hp.add_current(-damage)
	pass
