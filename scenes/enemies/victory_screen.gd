extends Node



func _on_hunter_enemy_died() -> void:
	get_tree().change_scene_to_file("res://scenes/enemies/victory.tscn")
