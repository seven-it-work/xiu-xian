extends Control

func _ready() -> void:
	var p=People.build({lv=10,hp=10})
	var p1=People.build({lv=10,hp=10})
	$ScrollContainer/Fight.init([p,p1])
	pass
