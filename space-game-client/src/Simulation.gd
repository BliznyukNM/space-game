extends Node


var nbodies : Array # NewtonBodies that are fully simulated by Newtons law
var sbodies : Array # SimulatedBodies that are only affected by NewtonBodies 


func _ready() -> void:
	nbodies = $Bodies.get_tree().get_nodes_in_group("nbody")
	sbodies = $Bodies.get_tree().get_nodes_in_group("sbody")


func _process(delta : float) -> void:
	for nbody in nbodies:
		Newton.apply_gravitation(nbody, nbodies, delta)
	
	for sbody in sbodies:
		Newton.apply_gravitation(sbody, nbodies, delta)
