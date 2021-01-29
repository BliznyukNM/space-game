extends Spatial
class_name NBody


export var mass : float
export var velocity : Vector3
export var debug_color := Color.white


func _process(delta: float) -> void:
	translation += velocity * delta