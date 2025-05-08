extends Node
class_name People

var uid:String=""
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
# 集气速度
@export var gas_gathering:Property=Property.buildByJsonStr("""
  {
	"filename": "res://objs/Property/Property.gd",
	"name_str": "集气",
	"current_value": 0.0,
	"min_v": 300.0,
	"max_v": 1000.0,
	"growth_min": 0.0,
	"growth_max": 1.0,
	"growth_factor": -1.0,
	"grow_value": 0.0,
	"growth_times": 0,
	"data_type": 1
  }
  """)
@export var skillList:Array=[BaseDefenseSkill.new(),BaseAttackSkill.new()]

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
	var propertList:Array[String]=ObjectUtils.get_property_key(p)
	for key in propertList:
		if p[key] is Property:
			if peopleBuilder[key] && peopleBuilder[key]>0:
				p[key].growth_add(peopleBuilder.hp)
	# 成长
	for i in peopleBuilder.lv:
		for key in propertList:
			if p[key] is Property:
				p[key].do_growth()
	return p
