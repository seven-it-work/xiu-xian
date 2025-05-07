extends Control

func changeTips():
	print("改变tips了")
	pass

func init(enemyList:Array):
	for i in $VBoxContainer/Enemy.get_children():
		i.free()
	for i in enemyList:
		var f_p=preload("uid://ci348ue1cl55n").instantiate()
		$VBoxContainer/Enemy.add_child(f_p)
	for i in $VBoxContainer/player.get_children():
		i.free()
	var f_p=preload("uid://ci348ue1cl55n").instantiate()
	var player=People.build();
	f_p.init(player)
	$VBoxContainer/player.add_child(f_p)
	var skill=Skill.new()
	skill.name_str="测试"
	skill.desc="测试描述"
	$VBoxContainer/SkillList/GridContainer/Skill.init(skill,f_p,$VBoxContainer/player.get_children(),$VBoxContainer/Enemy.get_children())
	pass
