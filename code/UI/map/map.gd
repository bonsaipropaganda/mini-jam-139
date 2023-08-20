extends Control


signal encounter_chosen(encounter: Encounter)


@export var starting_nodes: Array[MapNode] 

var current_node: MapNode

@onready var nodes: Control = $MapNodes


func _ready() -> void:
	nodes.propagate_call(&"lock")
	_connect_map_nodes()


func show_map() -> void:
	visible = true
	nodes.propagate_call(&"lock")
	
	if current_node:
		current_node.unlock_next_paths()
	else:
		# If we did not come from the map, unlock the starting nodes only
		for n in starting_nodes:
			n.unlock()


func _connect_map_nodes() -> void:
	var to_connect: Array[Node] = nodes.get_children()
	
	while not to_connect.is_empty():
		var node: Node = to_connect.pop_back()
		to_connect.append_array(node.get_children())
		
		if node is MapNode:
			node.pressed.connect(func():
				visible = false
				encounter_chosen.emit(node.encounter)
				current_node = node
			)
