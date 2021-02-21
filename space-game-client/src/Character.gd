extends KinematicBody


export var speed := 5.0


var _gravity: Vector3
var _gravity_up: Vector3
var _planet: NBody
var _velocity: Vector3


func apply_gravity(gravity: Vector3, gravity_up: Vector3, planet: NBody) -> void:
	_gravity = gravity
	_gravity_up = gravity_up
	_planet = planet


func _physics_process(delta: float) -> void:
	_align_gravity()
	
	var input: = _get_input()
	input = Quat(rotation) * input
	
	_velocity += _gravity * delta
	_velocity = move_and_slide(_velocity, _gravity_up, true)
	translation += _planet.velocity * delta
	translation += input * speed * delta



func _align_gravity() -> void:
	var new_x: Vector3 = _gravity_up.cross(transform.basis.z).normalized()
	var new_z: Vector3 = _gravity_up.cross(new_x).normalized()
	transform.basis = Basis(new_x, _gravity_up, -new_z)


func _get_input() -> Vector3:
	var input: = Vector3.ZERO
	input.x = Input.get_action_strength("character_left") - Input.get_action_strength("character_right")
	input.z = Input.get_action_strength("character_forward") - Input.get_action_strength("character_backward")
	input = input.normalized() if input.length_squared() > 1.0 else input
	return input
