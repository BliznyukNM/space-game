tool
extends Node


export var steps := 10
export var simulate_delta := 0.25
export var enable_simulation : bool


class RawBody:
	var mass : float
	var position : Vector3
	var velocity : Vector3
	var color : Color
	var path := Array()
	
	func _init(nbody : NBody) -> void:
		mass = nbody.mass
		position = nbody.translation
		velocity = nbody.velocity
		color = nbody.debug_color
		path.append(position)


func _ready() -> void:
	$Drawer.clear()


func _process(delta: float) -> void:
	if Engine.editor_hint:
		_draw_simulation()
	else:
		_simulate(delta)


func _simulate(delta : float) -> void:
	var nbodies := $NBodies.get_children()
	
	for nbody in nbodies:
		Newton.apply_gravitation(nbody, nbodies, delta)
	
	for nbody in nbodies:
		nbody.position += nbody.velocity * delta


func _draw_simulation() -> void:
	if not enable_simulation: return
	
	var rbodies := Array() # rbody for RawBody
	var nbodies := $NBodies.get_children() # nbody for NewtonBody
	
	# Convert bodies data to raw data for simulation
	for nbody in nbodies:
		rbodies.append(RawBody.new(nbody))
	
	for _i in range(0, steps):
		for rbody in rbodies:
			Newton.apply_gravitation(rbody, rbodies, simulate_delta)
		for rbody in rbodies:
			rbody.position += rbody.velocity * simulate_delta
			rbody.path.append(rbody.position)
	
	$Drawer.clear()
	for rbody in rbodies:
		$Drawer.begin(Mesh.PRIMITIVE_LINE_STRIP)
		$Drawer.set_color(rbody.color)
		for point in rbody.path:
			$Drawer.add_vertex(point)
		$Drawer.end()
