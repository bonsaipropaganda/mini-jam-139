class_name MapNode
extends Button


@export var next_nodes: Array[MapNode] = []
@export var encounter: Encounter


func unlock_next_paths() -> void:
	for n in next_nodes:
		n.unlock()


func lock() -> void:
	disabled = true


func unlock() -> void:
	disabled = false
