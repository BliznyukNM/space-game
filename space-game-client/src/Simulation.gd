extends Node


var bodies : Array
var time_scale := 0.0


export var simulation_count := 100


onready var celestial_physics := $"/root/CelestialPhysics"


func _ready() -> void:
	bodies = $"Planets".get_children()


func _process(delta: float) -> void:
	for body in bodies:
		body.reset()
		body.clear()
		body.begin(PrimitiveMesh.PRIMITIVE_LINES)
		body.set_color(Color(1, 1, 1))
		body.add_vertex(body.transform.origin)
	
	for i in range(0, simulation_count):
		celestial_physics.update_bodies(bodies, delta)
		
		for body in bodies:
			body.add_vertex(body.current_position)
	
	for body in bodies:
		body.end()
