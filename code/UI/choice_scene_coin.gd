extends Control

signal choice_selected(choice)

var basic_attack_coin = "res://code/resources/coins/basic_attack.tres"
var basic_heal_coin = "res://code/resources/coins/basic_heal.tres"
var risky_attack_coin = "res://code/resources/coins/risky_attack.tres"

var possible_coins = [basic_attack_coin, basic_heal_coin, risky_attack_coin]

var choice_1
var choice_2

func _ready() -> void:
	# pick a random one for each and make sure it's not the same coin
	choice_1 = possible_coins.pick_random()
	choice_2 = possible_coins.pick_random()
	while choice_1 == choice_2:
		choice_2 = possible_coins.pick_random()
	
	# setup the UI
	$VBoxContainer/HBoxContainer/Choice1Button.text = choice_1
	$VBoxContainer/HBoxContainer/Choice2Button.text = choice_2



func _on_choice_1_button_pressed() -> void:
	choice_selected.emit(choice_1)

func _on_choice_2_button_pressed() -> void:
	choice_selected.emit(choice_2)
