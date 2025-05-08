class_name DateUtils

## 计算两个时间差
static func calculate_time_difference(timestamp1: int, timestamp2: int, unit: String = "天") -> int:
	# 获取两个时间戳对应的日期字典
	var date_dict1 = Time.get_date_dict_from_unix_time(timestamp1)
	var date_dict2 = Time.get_date_dict_from_unix_time(timestamp2)
	
	# 提取年、月、日
	var year1 = date_dict1.year
	var month1 = date_dict1.month
	var day1 = date_dict1.day
	
	var year2 = date_dict2.year
	var month2 = date_dict2.month
	var day2 = date_dict2.day
	
	# 计算两个日期之间的差异
	var years_diff = year2 - year1
	var months_diff = month2 - month1
	var days_diff = day2 - day1
	# 根据单位返回相应的时间差
	match unit:
		"年":
			return years_diff
		"月":
			return years_diff * 12 + months_diff
		"天":
			return (timestamp2 - timestamp1)/24/60/60
		_:
			return 0  # 默认返回 0，如果单位无效
	
