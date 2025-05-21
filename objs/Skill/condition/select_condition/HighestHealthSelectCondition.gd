extends BaseCondition
class_name HighestHealthSelectCondition

func _init() -> void:
	self.name_str="血量最高"
	pass

func filter_china(target_list:Array,size:int):
	if size>=target_list.size():
		return target_list;
	target_list.sort_custom(sort_func)
	return target_list.slice(0,size)
	
func sort_func(obj):
	return obj
