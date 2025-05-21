extends BaseCondition
class_name SelectAllCondition

func _init() -> void:
	self.name_str="全部"
	pass

func filter_china(target_list:Array,size:int):
	return target_list;
