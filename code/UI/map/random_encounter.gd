class_name RandomEncounter
extends Encounter


var Field := preload("res://scenes/battlefield.tscn")


@export var possible_encounters: Array[Encounter] = []


func create_and_setup_scene() -> Node:
	var encounter: Encounter
	if possible_encounters.size() == 0:
		push_warning("RandomEncounter with no encounter configured")
		return null
	else:
		var idx: int = Global.rng.randi_range(0, possible_encounters.size()-1)
		encounter = possible_encounters[idx]
	
	return encounter.create_and_setup_scene()
	
