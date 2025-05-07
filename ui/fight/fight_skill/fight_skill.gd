extends Control
class_name FightSkill

var all_target_list:Array=[]
var all_friendly_list:Array=[]
var user:FightPeopleNode
var skill:Skill

func init(skill:Skill,user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	self.all_target_list=all_target_list
	self.all_friendly_list=all_friendly_list
	self.user=user
	self.skill=skill
	## ui初始化
	$HBoxContainer/Label.text=skill.name_str
	$HBoxContainer/VBoxContainer/RichTextLabel.text=skill.desc
	pass

func _process(delta: float) -> void:
	if skill:
		pass

func cancel():
	# 调整技能边框颜色为灰色(恢复选中效果)
	pass

func removeSelf():
	# 隐藏自己
	self.visible=false
	pass

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# 1、调整技能边框颜色为红色
		# 2、调用fight的tips方法
		var fightUi=get_node("/root/Main/ScrollContainer/FightUi")
		fightUi.changeTips()
		# todo 这里是选中了
		if event.pressed:
			print("点击了")
		pass
	pass # Replace with function body.
