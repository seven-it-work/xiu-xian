extends Node
class_name People

#region 属性
@export var name_str: String
# 生命值
@export var hp: Property=Property.buildByJsonStr("""
{
	"filename": "res://objs/Property/Property.gd",
	"name_str": "生命值",
	"current_value": 100.0,
	"min_v": 0.0,
	"max_v": 100.0,
	"growth_min": 0.0,
	"growth_max": 50.0,
	"growth_factor": 1.0,
	"grow_value": 0.0,
	"growth_times": 0,
	"data_type": 2
  }""")
# 护盾值
@export var shield: Property=Property.buildByJsonStr("""
{
	"filename": "res://objs/Property/Property.gd",
	"name_str": "护盾值",
	"current_value": 0.0,
	"min_v": 0.0,
	"max_v": 100.0,
	"growth_min": 0.0,
	"growth_max": 10.0,
	"growth_factor": 1.0,
	"grow_value": 0.0,
	"growth_times": 0,
	"data_type": 2
  }""")
# 攻击力
@export var atk:Property=Property.buildByJsonStr("""
  {
	"filename": "res://objs/Property/Property.gd",
	"name_str": "攻击力",
	"current_value": 0.0,
	"min_v": 10.0,
	"max_v": 20.0,
	"growth_min": 0.0,
	"growth_max": 10.0,
	"growth_factor": 1.0,
	"grow_value": 0.0,
	"growth_times": 0,
	"data_type": 1
  }
  """)
# 防御力
@export var def:Property=Property.buildByJsonStr("""
  {
	"filename": "res://objs/Property/Property.gd",
	"name_str": "防御力",
	"current_value": 0.0,
	"min_v": 5.0,
	"max_v": 10.0,
	"growth_min": 0.0,
	"growth_max": 5.0,
	"growth_factor": 1.0,
	"grow_value": 0.0,
	"growth_times": 0,
	"data_type": 1
  }
  """)

@export var SkillList:Array=[]

# endregion


static func build(builder=null)->People:
	var peopleBuilder:PeopleBuilder
	if builder ==null :
		peopleBuilder=PeopleBuilder.new()
	elif  builder is Dictionary:
		peopleBuilder=PeopleBuilder.new()
		ObjectUtils.copyBean(builder,peopleBuilder)
	elif  builder is PeopleBuilder:
		peopleBuilder=builder
	else :
		print("不支持")
		return null
	var json_string=FileAccess.get_file_as_string("res://objs/People/base.json")
	var p:People=JsonUtils.json_2_obj(JSON.parse_string(json_string))
	if peopleBuilder.hp>0:
		p.hp.growth_add(peopleBuilder.hp)
	if peopleBuilder.atk>0:
		p.atk.growth_add(peopleBuilder.atk)
	if peopleBuilder.def>0:
		p.def.growth_add(peopleBuilder.def)
	# 成长
	for i in peopleBuilder.lv:
		p.hp.do_growth()
	return p
