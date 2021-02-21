extends Spatial
class_name NBody


export var mass : float
export var velocity : Vector3
export var debug_color := Color.white


func apply_gravity(gravity: Vector3, delta: float) -> void:
	velocity += gravity * delta


func proceed_gravity(delta: float) -> void:
	translation += velocity * delta
