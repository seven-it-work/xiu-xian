extends BaseSkillAction
class_name BaseAttack

func do_action(skil:Skill,user:FightPeopleNode,target_list:Array):
	# 播放动画
	AnimationUtils.batchSkillSpecialEffects(skil.getSpecialEffectNode(),user,target_list)
	var damage=user.people.atk.get_current()
	for target in target_list:
		# 伤害计算
		target.people.hp.add_current(-damage)
	pass
