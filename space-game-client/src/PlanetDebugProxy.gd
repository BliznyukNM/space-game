extends ImmediateGeometry


export var mass : float = 1.0
export var start_velocity : Vector3


var current_position : Vector3
var current_velocity : Vector3


func reset() -> void:
	current_position = transform.origin
	current_velocity = start_velocity


func update_position(delta : float) -> void:
	current_position += current_velocity * delta
