extends Node
# 常量类

enum WU_XING{
	Metal,
	Wood,
	Water,
	Fire,
	Earth
}

const WU_XING_COLOR:Dictionary={
	WU_XING.Metal:Color(255, 215, 0),
	WU_XING.Wood:Color(0, 128, 0),
	WU_XING.Water:Color(0, 105, 148),
	WU_XING.Fire:Color(255, 69, 0),
	WU_XING.Earth:Color(210, 180, 140),
}

static func 是否克制(source:WU_XING,target:WU_XING)->bool:
	if source==WU_XING.Metal:
		return [WU_XING.Wood].has(target)
	if source==WU_XING.Wood:
		return [WU_XING.Earth].has(target)
	if source==WU_XING.Earth:
		return [WU_XING.Water].has(target)
	if source==WU_XING.Water:
		return [WU_XING.Fire].has(target)
	if source==WU_XING.Fire:
		return [WU_XING.Metal].has(target)
	return false
