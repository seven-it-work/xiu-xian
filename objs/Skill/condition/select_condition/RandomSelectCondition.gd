extends BaseCondition
class_name RandomSelectCondition

func _init() -> void:
	self.name_str="随机"
	pass

func filter_china(target_list:Array,size:int):
	return ArrayUtls.random_pick(target_list,size,false)
