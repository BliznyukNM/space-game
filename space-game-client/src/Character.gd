extends Spatial


export var speed := 10.0


var velocity : Vector3


func move(direction : Vector3, delta : float) -> void:
	var q_rotation = Quat(rotation)
	velocity += q_rotation * direction * speed * delta


func _process(delta: float) -> void:
	translation += velocity * delta
