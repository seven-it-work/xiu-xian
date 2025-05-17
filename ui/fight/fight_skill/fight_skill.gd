extends DissolvedUi
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
	$SubViewport/PanelContainer/HBoxContainer/Label.text=skill.name_str
	$SubViewport/PanelContainer/HBoxContainer/VBoxContainer/RichTextLabel.text=skill.desc
	pass

func _process(delta: float) -> void:
	if skill:
		pass

func selected():
	# 1、调整当前节点边框颜色为红色
	var panel:StyleBox= $SubViewport/PanelContainer.get_theme_stylebox("panel").duplicate()
	panel.border_color = Color(1, 0, 0, 1)  # 红色边框
	$SubViewport/PanelContainer.add_theme_stylebox_override("panel",panel)

func cancel():
	# 调整技能边框颜色为灰色(恢复选中效果)
	var panel:StyleBox= $SubViewport/PanelContainer.get_theme_stylebox("panel").duplicate()
	panel.border_color = Color(0.8, 0.8, 0.8)
	$SubViewport/PanelContainer.add_theme_stylebox_override("panel",panel)
	pass

func do_dissolved(is_free:bool=false):
	super.do_dissolved(is_free)
	self.cancel()


func _on_gui_input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.pressed and
	 event.button_index==MOUSE_BUTTON_LEFT) or (
		event is InputEventScreenTouch and event.pressed):
		var fightUi=get_node("/root/Main/ScrollContainer/FightUi")
		if fightUi:
			fightUi.selectFightSkillNode(self)
		pass
	pass # Replace with function body.
