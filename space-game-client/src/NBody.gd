extends Spatial
class_name NBody


export var mass : float
export var velocity : Vector3
export var debug_color := Color.white


# Interface for NBody
var position : Vector3 setget set_position, get_position
func get_position() -> Vector3:
	return translation
func set_position(value : Vector3) -> void:
	translation = value # todo: think about move_and_slide
