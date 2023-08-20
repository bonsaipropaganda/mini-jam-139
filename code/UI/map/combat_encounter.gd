class_name CombatEncounter
extends Encounter


var Field := preload("res://scenes/battlefield.tscn")


@export var possible_enemies: Array[PackedScene] = []


func create_and_setup_scene() -> Node:
	var enemy_scene: PackedScene
	if possible_enemies.size() == 0:
		push_warning("CombatEncounter with no encounter configured")
		enemy_scene = load("res://scenes/enemies/Willo.tscn")
	else:
		var idx: int = Global.rng.randi_range(0, possible_enemies.size()-1)
		enemy_scene = possible_enemies[idx]
	
	var field: BattleField = Field.instantiate()
	field.set_enemy(enemy_scene)
	
	return field
	
