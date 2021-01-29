extends Node


export var character_node : NodePath


onready var character := get_node(character_node)

onready var camera := $"../Camera"
onready var camera_pivot := $"../Camera/Pivot"


export var mouse_sensitivity = 0.002


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camera.rotate_y(-event.relative.x * mouse_sensitivity)
		camera_pivot.rotate_x(-event.relative.y * mouse_sensitivity)


func _process(delta: float) -> void:
	# Get movement input and applying it
	var move_direction := Vector3.ZERO
		
	move_direction.z = Input.get_action_strength("character_backward") - Input.get_action_strength("character_forward")
	move_direction.x = Input.get_action_strength("character_right") - Input.get_action_strength("character_left")
	move_direction.y = Input.get_action_strength("character_up") - Input.get_action_strength("character_down")
	
	if move_direction.length_squared() > 1: move_direction = move_direction.normalized()
	character.move(move_direction, delta)
	
	# Update camera and character position and rotation
	character.rotation = Quat(camera_pivot.global_transform.basis).get_euler()
	camera.translation = character.translation
