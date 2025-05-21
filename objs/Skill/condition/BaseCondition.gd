extends Node
class_name BaseCondition

@export var name_str:String=""
# todo 战力系数

func start_filter(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	pass

func filter_china(target_list:Array,size:int)->Array:
	return target_list
