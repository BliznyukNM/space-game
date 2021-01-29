class_name Newton


const G := 0.05


static func apply_gravitation(nbody_a, nbodies : Array, delta : float) -> void:
	for nbody_b in nbodies:
		if nbody_a == nbody_b: continue
		var sqr_distance : float = (nbody_b.translation - nbody_a.translation).length_squared()
		var force_direction : Vector3 = (nbody_b.translation - nbody_a.translation).normalized()
		var acceleration : Vector3 = force_direction * G * nbody_b.mass / sqr_distance
		nbody_a.velocity += acceleration * delta
