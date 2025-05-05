extends Node

class_name BaseEntity

var name_str: String
var atk: float
var def: float
var hp: float

func _init(p_name: String = "", p_atk: float = 0.0, p_def: float = 0.0, p_hp: float = 0.0):
	name_str = p_name
	atk = p_atk
	def = p_def
	hp = p_hp

func take_damage(attacker: BaseEntity) -> float:
	var damage = maxf(attacker.atk - def, 1)
	hp -= damage
	return damage
