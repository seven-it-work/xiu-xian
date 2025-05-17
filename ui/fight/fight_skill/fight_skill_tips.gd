extends Control

var fightSkill:FightSkill

func init(fightSkill:FightSkill):
	self.fightSkill=fightSkill
	print("初始化技能提示")
	# todo ui初始化
	pass

func _on_confirm_pressed() -> void:
	self.visible=false
	# 移除FightSkillNode动画
	fightSkill.do_dissolved()

	## 执行技能
	await fightSkill.skill.use(fightSkill.user,fightSkill.all_friendly_list,fightSkill.all_target_list)


func _on_cancel_pressed() -> void:
	fightSkill.cancel()
	self.visible=false
	pass # Replace with function body.
