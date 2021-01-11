extends KinematicBody
class_name CelestialBody


export var mass := 1.0
export var radius := 1.0
export var initial_velocity := Vector3(0.0, 0.0, 0.0)

var current_velocity : Vector3


func _ready() -> void:
	current_velocity = initial_velocity


func update_velocity(bodies : Array, delta : float) -> void:
	for body in bodies:
		if body != self:
			var sqr_distance : float = (body.translation - translation).length_squared()
			var force_direction : Vector3 = (body.translation - translation).normalized()
			var acceleration : Vector3 = force_direction * 0.5 * body.mass / sqr_distance
			current_velocity += acceleration * delta


func update_position(delta : float) -> void:
	translate(current_velocity * delta)
