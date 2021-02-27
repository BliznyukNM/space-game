class_name Newton


const G := 10


static func _get_gravity_acceleration(body_a, body_b) -> Vector3:
	var sqr_distance : float = (body_b.translation - body_a.translation).length_squared()
	var force_direction : Vector3 = (body_b.translation - body_a.translation).normalized()
	return force_direction * G * body_b.mass / sqr_distance


static func apply_gravity_nbody(nbody_a, nbodies : Array) -> void:
	var acceleration: = Vector3.ZERO

	for nbody_b in nbodies:
		if nbody_a == nbody_b: continue
		acceleration += _get_gravity_acceleration(nbody_a, nbody_b)
	
	nbody_a.apply_gravity(acceleration)


static func apply_gravity_sbody(sbody, nbodies: Array) -> void:
	var strongest_gravitation: = Vector3.ZERO
	var target_nbody = null
	var acceleration: = Vector3.ZERO

	for nbody in nbodies:
		var next_acceleration: = _get_gravity_acceleration(sbody, nbody)
		acceleration += next_acceleration

		if next_acceleration.length_squared() > strongest_gravitation.length_squared():
			strongest_gravitation = next_acceleration
			target_nbody = nbody
	
	sbody.apply_gravity(acceleration, -strongest_gravitation.normalized(),  target_nbody)
