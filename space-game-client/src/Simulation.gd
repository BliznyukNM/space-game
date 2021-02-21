extends Node


var nbodies : Array # NewtonBodies that are fully simulated by Newtons law
var sbodies : Array # SimulatedBodies that are only affected by NewtonBodies 


func _ready() -> void:
	nbodies = get_tree().get_nodes_in_group("nbody")
	sbodies = get_tree().get_nodes_in_group("sbody")


func _physics_process(delta: float) -> void:
	for nbody in nbodies:
		Newton.apply_gravity_nbody(nbody, nbodies)
	
	for sbody in sbodies:
		Newton.apply_gravity_sbody(sbody, nbodies)
	
	for nbody in nbodies:
		nbody.proceed_gravity(delta)
