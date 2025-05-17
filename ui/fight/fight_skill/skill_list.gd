extends Control

var fightPeopleNode:FightPeopleNode
# 屏幕宽度缓存
var pre_w_cache=0;
# 左右间距
var left_right_spacing=20;
# 偏移间距
var ooffset=5;

func init(fightPeopleNode:FightPeopleNode,all_friendly_list:Array,all_target_list:Array):
	self.fightPeopleNode=fightPeopleNode
	# 1、从people的skillList中读取，并进行ui设置
	for i in self.get_children():
		i.queue_free()
	for i in fightPeopleNode.people.skillList:
		var node=preload("uid://d2jfxnnooybkl").instantiate()
		node.init(i,fightPeopleNode,all_friendly_list,all_target_list)
		self.add_child(node)
	pass


func _process(delta: float) -> void:
	if self.get_children().size()>0:
		var skill_node=self.get_children().get(0)
		# 实时获取屏幕宽度
		var w=get_viewport().get_visible_rect().size.x
		if pre_w_cache!=w:
			pre_w_cache=w
			# 间距计算
			var spacing=(w-(left_right_spacing*2)-skill_node.size.x)/(self.get_children().size()-1)
			# 重新分布子节点
			for i in self.get_children().size():
				var node=self.get_children().get(i)
				node.position.x=ProbabilityUtils.offestCalculated(left_right_spacing+spacing*(i),ooffset)
	pass
