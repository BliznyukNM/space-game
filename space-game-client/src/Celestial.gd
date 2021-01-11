extends KinematicBody
class_name Celestial


export var mass := 1.0
export var radius := 1.0
export var initial_velocity := Vector3(0.0, 0.0, 0.0)

var current_velocity : Vector3


func _ready() -> void:
	current_velocity = initial_velocity


func update_position(delta : float) -> void:
	translate(current_velocity * delta)
