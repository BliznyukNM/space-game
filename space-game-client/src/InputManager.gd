extends Node


export var character_node : NodePath


onready var character: Character = get_node(character_node)
onready var camera := get_node(character_node).get_node("Camera")


export var mouse_sensitivity = 0.002


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		character.rotate_object_local(Vector3.UP, -event.relative.x * mouse_sensitivity)
		camera.rotate_object_local(Vector3.RIGHT, -event.relative.y * mouse_sensitivity)


func _process(_delta: float) -> void:
	var move_direction := Vector3.ZERO
		
	move_direction.z = Input.get_action_strength("character_forward") - Input.get_action_strength("character_backward")
	move_direction.x = Input.get_action_strength("character_left") -  Input.get_action_strength("character_right")
	if Input.is_action_just_pressed("character_jump"):
		move_direction.y = 1.0
	
	if move_direction.length_squared() > 1:
		move_direction = move_direction.normalized()
	character.move(move_direction)
