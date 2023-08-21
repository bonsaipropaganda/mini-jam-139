extends Node2D


@export var first_encounter: Encounter


var encounter_node: Node
var player: Node


func _ready() -> void:
	player = preload("res://scenes/player.tscn").instantiate()
	use_encounter(first_encounter)
	# give the menu music time to fade out
	await !MusicManager.music_playing
	if !MusicManager.main_theme_1.is_playing():
		MusicManager.main_theme_1.play()
		MusicManager.fade("in", MusicManager.main_theme_1)


func use_encounter(enc: Encounter) -> void:
	if encounter_node:
		if player.is_inside_tree():
			player.get_parent().remove_child(player)
		encounter_node.queue_free()
	
	encounter_node = enc.create_and_setup_scene()
	add_child(encounter_node)
	if encounter_node.has_method(&"set_player"):
		encounter_node.set_player(player)
	encounter_node.encounter_ended.connect(func():
		%Map.show_map()
	)


func _on_map_encounter_chosen(enc: Encounter) -> void:
	use_encounter(enc)
