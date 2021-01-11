extends Control
class_name TimeControl


signal change_time_scale(value)


func _on_button_pressed(value: int) -> void:
	emit_signal("change_time_scale", value)
