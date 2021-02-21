extends KinematicBody
class_name Character


export var speed := 5.0


var _gravity: Vector3
var _gravity_up: Vector3
var _planet: NBody
var _velocity: Vector3
var _input: Vector3


func apply_gravity(gravity: Vector3, gravity_up: Vector3, planet: NBody) -> void:
	_gravity = gravity
	_gravity_up = gravity_up
	_planet = planet


func move(input: Vector3) -> void:
	_input = Quat(rotation) * input


func _physics_process(delta: float) -> void:
	_align_gravity()
	
	
	if not is_on_floor():
		_velocity += _gravity * delta
		_velocity = move_and_slide(_velocity, _gravity_up, true)
	else:
		_velocity = Vector3.ZERO
	
	translation += _planet.velocity * delta
	translation += _input * speed * delta



func _align_gravity() -> void:
	var new_x: Vector3 = _gravity_up.cross(transform.basis.z).normalized()
	var new_z: Vector3 = _gravity_up.cross(new_x).normalized()
	transform.basis = Basis(new_x, _gravity_up, -new_z)
