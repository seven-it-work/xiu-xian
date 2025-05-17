extends SubViewportContainer
class_name DissolvedUi

@export var edge_color=Color(1.0, 0.5, 0.0)

func _init() -> void:
	pass

func _ready() -> void:
	self.material.set_shader_parameter("edge_color",self.edge_color)
	_random_noise()
	$SubViewport.size=$SubViewport.get_child(0).size
	

func _random_noise():
	var noise:FastNoiseLite=self.material.get_shader_parameter("noise_tex").noise
	noise.seed=randi_range(0,9999)
	noise.offset=Vector3(randf_range(-1000,1000),randf_range(-1000,1000),randf_range(-1000,1000))
	

func do_dissolved(is_free:bool=false):
	var tween=create_tween()
	tween.set_loops(1)
	tween.parallel().tween_property(self.material,"shader_parameter/edge_width",0.1,0.5)
	tween.parallel().tween_property(self.material,"shader_parameter/dissolve_threshold",1,1)
	await tween.finished
	_random_noise()
	if is_free:
		self.queue_free()
	else:
		self.visible=false
		self.material.set_shader_parameter("edge_width",0.0)
		self.material.set_shader_parameter("dissolve_threshold",0.0)
