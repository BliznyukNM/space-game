extends Spatial


export var speed := 10.0


var current_velocity : Vector3


func move(direction : Vector3) -> void:
	current_velocity = direction * speed


func _process(delta: float) -> void:
	var q_rotation = Quat(rotation)
	translation += q_rotation * current_velocity * delta
