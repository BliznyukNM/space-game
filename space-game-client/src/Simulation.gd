extends Node


var bodies : Array
var time_scale := 0.0


func _ready() -> void:
	bodies = get_tree().get_nodes_in_group("celestial")


func _process(delta: float) -> void:
	delta *= time_scale
	
	for body in bodies:
		body.update_velocity(bodies, delta)
	
	for body in bodies:
		body.update_position(delta)


func _on_change_time_scale(value) -> void:
	time_scale = value
