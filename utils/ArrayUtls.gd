@tool
class_name  ArrayUtls

## 从数组中random pick对象
# arr:数组
# size:pick个数
# is_duplicate:否运行pick对象重复
static  func random_pick(arr:Array,size:int=1,is_duplicate:bool=true)->Array:
	var re=[]
	if size <= 0:
		return re
	if is_duplicate:
		for i in size:
			re.append(arr.pick_random())
	else:
		if size >= arr.size():
			return arr.duplicate()
		var shuffled = arr.duplicate()
		shuffled.shuffle()
		return shuffled.slice(0, size)
	return []

# 判断两个数组是否相等
static func is_equal(arr1:Array,arr2:Array)->bool:
	if arr1.size()!=arr2.size():
		return false
	for i in arr1:
		if i not in arr2:
			return false
	return true
