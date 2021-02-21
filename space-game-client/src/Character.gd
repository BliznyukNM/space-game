extends KinematicBody


export var speed := 5.0


var gravity: Vector3
var strongest_gravity: Vector3


func apply_gravity(gravity: Vector3, delta: float) -> void:
	self.gravity += gravity * delta
	strongest_gravity = gravity if gravity.length_squared() > strongest_gravity.length_squared() else strongest_gravity


func proceed_gravity(_delta: float) -> void:
	gravity = move_and_slide(gravity, -strongest_gravity, true)


func move(direction: Vector3) -> void:
	var q_rotation = Quat(rotation)
	var rotated_movement = q_rotation * direction * speed
	move_and_slide(rotated_movement, -strongest_gravity, true)


func _physics_process(delta: float) -> void:
	if strongest_gravity.length_squared() > 0.01:
		_align_gravity()
	
	var input: = _get_input()
	move(input)

	strongest_gravity = Vector3.ZERO


func _align_gravity() -> void:
	var gravity_up = -strongest_gravity.normalized()
	var new_x: Vector3 = gravity_up.cross(transform.basis.z).normalized()
	var new_z: Vector3 = gravity_up.cross(new_x).normalized()
	transform.basis = Basis(new_x, gravity_up, -new_z)


func _get_input() -> Vector3:
	var input: = Vector3.ZERO
	input.x = Input.get_action_strength("character_left") - Input.get_action_strength("character_right")
	input.z = Input.get_action_strength("character_forward") - Input.get_action_strength("character_backward")
	input = input.normalized() if input.length_squared() > 1.0 else input
	return input
