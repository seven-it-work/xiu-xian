extends HBoxContainer

enum ScreenZoom{SLIDER,SPINBOX}

@export var mode:ScreenZoom=ScreenZoom.SPINBOX

func _ready() -> void:
	if mode==ScreenZoom.SPINBOX:
		$SpinBox.visible=true
		$Label.visible=false
		$HSlider.visible=false
	if mode==ScreenZoom.SLIDER:
		$SpinBox.visible=false
		$Label.visible=true
		$HSlider.visible=true
	pass

func _on_h_slider_value_changed(value: float) -> void:
	get_window().content_scale_factor=value
	$Label.text="x%0.1f"%value
	pass # Replace with function body.
