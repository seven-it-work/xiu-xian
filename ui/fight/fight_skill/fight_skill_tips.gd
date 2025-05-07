extends Node

var fightSkill:FightSkill

func init(fightSkill:FightSkill):
	self.fightSkill=fightSkill
	# todo ui初始化
	pass

func _on_confirm_pressed() -> void:
	# 将改skill移除
	fightSkill.removeSelf()
	# todo 制作移除动画

	## 执行技能
	await fightSkill.skill.use(fightSkill.user,fightSkill.all_friendly_list,fightSkill.all_target_list)
	# await skillSpecialEffects(fightSkill.skill.getSpecialEffectNode(),fightSkill.user,enemy)
	pass # Replace with function body.


func _on_cancel_pressed() -> void:
	fightSkill.cancel()
	pass # Replace with function body.
