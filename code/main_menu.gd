extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !MusicManager.music_playing:
		MusicManager.menu_music.play()



func _on_start_button_pressed() -> void:
	MusicManager.fade("out", MusicManager.menu_music)
	get_tree().change_scene_to_file("res://scenes/main.tscn")
