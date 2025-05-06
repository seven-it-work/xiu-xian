extends PanelContainer


func init(enemyList:Array):
	for i in $VBoxContainer/Enemy.get_children():
		i.free()
	for i in enemyList:
		var f_p=preload("res://ui/fight/fight_people/fight_people.tscn").instantiate()
		$VBoxContainer/Enemy.add_child(f_p)
	
	var player=People.build();
	$VBoxContainer/player/PanelContainer.init(player)
	$VBoxContainer/SkillList/GridContainer/Skill.init($VBoxContainer/player/PanelContainer,$VBoxContainer/player.get_children(),$VBoxContainer/Enemy.get_children())
	pass
