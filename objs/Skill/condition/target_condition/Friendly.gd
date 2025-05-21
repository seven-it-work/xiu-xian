extends BaseCondition
class_name Friendly

func _init() -> void:
	self.name_str="队友"
	pass
	
func start_filter(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	return all_friendly_list
