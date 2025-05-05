extends Control

var player: BaseEntity
var enemy: BaseEntity

func _ready():
	# 初始化玩家和敌人
	player = BaseEntity.new("玩家", 10.0, 5.0, 100.0)
	enemy = BaseEntity.new("妖兽", 8.0, 3.0, 80.0)
	update_ui()

func _on_attack_button_pressed():
	# 玩家攻击
	var damage = enemy.take_damage(player)
	$VBoxContainer/BattleLog.text += "\n玩家对敌人造成 %d 点伤害" % damage
	
	# 检查敌人是否死亡
	if enemy.hp <= 0:
		$VBoxContainer/BattleLog.text += "\n战斗胜利！"
		$VBoxContainer/AttackButton.disabled = true
		return
	
	# 敌人反击
	damage = player.take_damage(enemy)
	$VBoxContainer/BattleLog.text += "\n敌人对玩家造成 %d 点伤害" % damage
	
	# 检查玩家是否死亡
	if player.hp <= 0:
		$VBoxContainer/BattleLog.text += "\n战斗失败！"
		$VBoxContainer/AttackButton.disabled = true
		return
	
	update_ui()

func update_ui():
	$VBoxContainer/PlayerInfo.text = "玩家信息:\n生命值: %d\n攻击力: %d\n防御力: %d" % [player.hp, player.atk, player.def]
	$VBoxContainer/EnemyInfo.text = "敌人信息:\n生命值: %d\n攻击力: %d\n防御力: %d" % [enemy.hp, enemy.atk, enemy.def]
