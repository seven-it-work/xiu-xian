extends Control

var is_player_round:bool=false
var fight_people_action_queues:Array=[]
var all_fight_people_map:Dictionary={}
var gas_gathering:Dictionary={}

func changeTips(tscnKey:String,initData):
	var tips_node=$VBoxContainer/tips.find_child(tscnKey)
	if !tips_node:
		printerr("错误节点名称",tscnKey)
		return
	if tips_node.has_method("init"):
		tips_node.init(initData)
	for i in $VBoxContainer/tips.get_children():
		i.visible=false
	tips_node.visible=true

func init(enemyList:Array):
	# 清理数据
	all_fight_people_map.clear()
	gas_gathering.clear()
	fight_people_action_queues.clear()	
	for i in $VBoxContainer/Enemy.get_children():
		i.free()
	for i in $VBoxContainer/GasList.get_children():
		i.free()
	for i in $VBoxContainer/player.get_children():
		i.free()
	# 新数据初始化
	for i in enemyList:
		var f_p=preload("uid://ci348ue1cl55n").instantiate()
		f_p.init(i)
		$VBoxContainer/Enemy.add_child(f_p)
		all_fight_people_map.set(i.uid,f_p)
	var f_p=preload("uid://ci348ue1cl55n").instantiate()
	# todo 这里的玩家信息，从全局中读取
	var player=People.build();
	player.name_str="3"
	player.uid="3"
	f_p.init(player)
	all_fight_people_map.set(player.uid,f_p)
	$VBoxContainer/player.add_child(f_p)

	$VBoxContainer/SkillList/SkillList.init(f_p,$VBoxContainer/player.get_children(),$VBoxContainer/Enemy.get_children())
	# 初始化集气
	for i in all_fight_people_map.keys():
		var people:People=all_fight_people_map.get(i).people
		var tempNode=preload("uid://dmj64ybr5132q").instantiate()
		tempNode.find_child("Label").text=people.name_str
		$VBoxContainer/GasList.add_child(tempNode)
		await get_tree().process_frame
		tempNode.position.x=0
		var peopleGasGatheringValue=people.gas_gathering.get_current()
		gas_gathering.set(i,{
			current_value=peopleGasGatheringValue,
			node=tempNode,
			step=($VBoxContainer/GasList.size.x+tempNode.size.x)/peopleGasGatheringValue,
		})
	pass

func _process(delta: float) -> void:
	if !is_player_round:
		if !gas_gathering.is_empty():
			# 集气判断，如果有人集气<=0则加入队列
			for i in gas_gathering.keys():
				var temp=gas_gathering.get(i)
				temp.current_value-=1;
				temp.node.position.x+=temp.step
				if temp.current_value<=0:
					var fightPeopleTemp=all_fight_people_map.get(i)
					# 重新获取集气
					temp.current_value=fightPeopleTemp.people.gas_gathering.get_current()
					temp.step=($VBoxContainer/GasList.size.x+temp.node.size.x)/temp.current_value
					temp.node.position.x=-temp.node.size.x
					fight_people_action_queues.append(fightPeopleTemp)
		if !fight_people_action_queues.is_empty():
			# 弹出队列第一个，并进行动作执行
			var fightPeopleNode=fight_people_action_queues.pop_front()
			# todo 这里可以换成玩家的标识
			if fightPeopleNode.people.uid=="3":
				$VBoxContainer/GridContainer/EndRound.disabled=false
				is_player_round=true
			else:
				print("待开发 ai的动作执行")
				pass
			pass
	pass

func _on_end_round_pressed() -> void:
	is_player_round=false
	$VBoxContainer/GridContainer/EndRound.disabled=true
	pass # Replace with function body.
