extends BaseCondition
class_name Self

func _init() -> void:
	self.name_str="自己"
	pass
	
func start_filter(user:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	return user
