extends Node2D

# this is for the fade function
var audio_volume
# value to change the audiostream player's volume by
var fade_increment = 1

var music_bus_on = true
var sfx_bus_on = true

var music_playing = false

signal fade_complete

# node refs
@onready var menu_music = $Menu
@onready var main_theme_1 = $MainTheme1
@onready var main_theme_2 = $MainTheme2

func _process(delta: float) -> void:
	if $MainTheme1.is_playing() or $MainTheme2.is_playing() or $Menu.is_playing():
		music_playing = true

# fades audiostreamplayers in or out
func fade(in_or_out: String,audiostreamplayer,start_value = null):
		if in_or_out == "in":
			# starts the stream off quiet
			audiostreamplayer.volume_db = -40 
			if start_value:
				audiostreamplayer.volume_db = start_value
			for i in 40:
				await get_tree().create_timer(.1).timeout
				audiostreamplayer.volume_db += fade_increment
		elif in_or_out == "out":
			for i in 40:
				await get_tree().create_timer(.1).timeout
				audiostreamplayer.volume_db -= fade_increment
		else: push_error("Fade in type not selected. First argument, type, must be 'in' or 'out'.")



func _on_main_theme_1_finished() -> void:
	$Menu.play()



func _on_menu_finished() -> void:
	$MainTheme1.play()
