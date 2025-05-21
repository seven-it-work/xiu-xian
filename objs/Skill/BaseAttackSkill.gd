extends Skill
class_name BaseAttackSkill

func _init() -> void:
	self.desc="随机对一个敌人造成普通攻击伤害"
	self.name_str="普通攻击"
	skill_type=Skill_Type.Attack
	select_condition=RandomSelectCondition.new()
	target_condition=Enemy.new()
	action=BaseAttack.new()
	target_size=2
	print(JsonUtils.obj_2_json(self))
	pass
