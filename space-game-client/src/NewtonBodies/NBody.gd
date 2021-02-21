extends Spatial
class_name NBody


export var mass : float
export var velocity : Vector3
export var debug_color := Color.white

var _gravity: Vector3


func apply_gravity(gravity: Vector3) -> void:
	_gravity = gravity


func proceed_gravity(delta: float) -> void:
	velocity += _gravity * delta
	translation += velocity * delta
