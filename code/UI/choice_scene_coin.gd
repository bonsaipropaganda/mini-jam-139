extends Control


signal coin_selected(choice: Coin)


@export var possible_coins: Array[Coin] = []


var choice_1: Coin
var choice_2: Coin


func _ready() -> void:
	# pick a random one for each and make sure it's not the same coin
	choice_1 = possible_coins.pick_random()
	choice_2 = possible_coins.pick_random()
	while choice_1 == choice_2:
		choice_2 = possible_coins.pick_random()
	
	# setup the UI
	$VBoxContainer/HBoxContainer/Choice1Button.text = choice_1.coin_name
	$VBoxContainer/HBoxContainer/Choice2Button.text = choice_2.coin_name


func _on_choice_1_button_pressed() -> void:
	coin_selected.emit(choice_1)


func _on_choice_2_button_pressed() -> void:
	coin_selected.emit(choice_2)
