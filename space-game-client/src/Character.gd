extends KinematicBody
class_name Character


export var speed := 5.0


var _gravity: Vector3
var _gravity_up: Vector3
var _planet: NBody
var _velocity: Vector3
var _input: Vector3
var _is_jump_pressed: bool


func apply_gravity(gravity: Vector3, gravity_up: Vector3, planet: NBody) -> void:
	_gravity = gravity
	_gravity_up = gravity_up
	_planet = planet


func move(input: Vector3) -> void:
	_input = Quat(rotation) * Vector3(input.x, 0, input.z)
	_is_jump_pressed = input.y > 0.0


func _physics_process(delta: float) -> void:
	translation += _planet.velocity * delta
	move_and_collide(_input * speed * delta)
	
	_align_gravity()
	var on_ground: = _is_touchin_ground()

	if _is_jump_pressed and on_ground:
		_velocity = move_and_slide(_gravity_up * 5, _gravity_up, false, 0)
		on_ground = false
	
	if not on_ground:
		_velocity += _gravity * delta
		_velocity = move_and_slide(_velocity, _gravity_up, false, 1)
	else:
		_velocity = Vector3.ZERO


func _is_touchin_ground() -> bool:
	var space_state: = get_world().direct_space_state
	var result: = space_state.intersect_ray(translation, translation - transform.basis.y * 0.1, [self])
	return not result.empty()


func _align_gravity() -> void:
	var new_x: Vector3 = _gravity_up.cross(transform.basis.z).normalized()
	var new_z: Vector3 = _gravity_up.cross(new_x).normalized()
	transform.basis = Basis(new_x, _gravity_up, -new_z)
