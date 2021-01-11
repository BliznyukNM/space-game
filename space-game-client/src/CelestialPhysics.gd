extends Node


var G := 0.05
export var scale := 100.0


func update_bodies(bodies : Array, delta : float) -> void:
	for body in bodies:
		_update_velocity(body, bodies, delta)
	
	for body in bodies:
		body.update_position(delta)


func _update_velocity(target : Spatial, bodies : Array, delta : float) -> void:
	for body in bodies:
		if body == target:
			continue
		
		var sqr_distance : float = (body.translation - target.translation).length_squared()
		var force_direction : Vector3 = (body.translation - target.translation).normalized()
		var acceleration : Vector3 = force_direction * G * scale * body.mass / sqr_distance
		target.current_velocity += acceleration * delta
