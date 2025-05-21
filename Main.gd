extends Control

func _ready() -> void:
	JsonUtils.json_2_obj(JSON.parse_string(FileAccess.get_file_as_string("res://objs/Skill/baseAttack.json")))
	
#	uid://c22vnda7wgb3u
	var f=FileAccess.open("res://Main.gd",FileAccess.READ)
	var id=ResourceLoader.get_resource_uid("res://Main.gd")
	print(id)
	print(ResourceUID.id_to_text(id))
	
	
	
	#var p=People.build({lv=10,hp=10})
	#p.name_str="1"
	#p.uid="1"
	#var p1=People.build({lv=10,hp=10})
	#p1.name_str="2"
	#p1.uid="2"
	#$ScrollContainer/FightUi.init([p,p1])
	pass

func _process(delta: float) -> void:
	self.size=get_viewport().get_visible_rect().size
	$ScrollContainer.size=self.size
	$ScrollContainer/FightUi.size=self.size
	pass
