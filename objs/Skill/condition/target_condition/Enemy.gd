extends BaseCondition
class_name Enemy

func _init() -> void:
	self.name_str="敌人"
	pass
	
func start_filter(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	return all_target_list
