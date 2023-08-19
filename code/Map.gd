extends Control




func _on_left_path_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_middle_path_pressed():
	get_tree().change_scene_to_file("res://gnome.tscn")


func _on_right_path_pressed():
	pass # Replace with function body.
