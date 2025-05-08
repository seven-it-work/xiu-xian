## 概率攻击
class_name ProbabilityUtils

## 偏移量随机取值
static func offestCalculated(num:float,offset:float)->float:
	var o=randf_range(-abs(offset),abs(offset))
	return num+o;


# 权重选择器
# d{数据:权重值}
static func weight_selector(d:Dictionary,size:int=1):
	var min=0;
	for v in d.values():
		min=minf(min,v)
	var temp_d={}
	for key in d:
		temp_d[key]=d[key]+abs(min)
	var total=temp_d.values().reduce(func(accum, number): return accum + number, 0)
	var re=[]
	for i in size:
		var temp=0;
		var value=randi_range(0,total)
		for key in temp_d:
			temp+=temp_d[key]
			if value<=temp:
				re.append(key)
				break
	return re;




# 概率计算器
static func probability(v:float,max:float=100)->bool:
	return randf_range(0,max)<=v;