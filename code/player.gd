extends CharacterBody2D

# node refs
@onready var coins_hbox = $"../CanvasLayer/UI/CoinsHBox"
@onready var deck_component = $DeckComponent

var current_hand = []

@export var opponent: Node2D:
	# if the opponent changes update the deck's opponent variable
	set(new_value):
		opponent = new_value
		$DeckComponent.opponent = opponent

func _on_coin_1_button_pressed() -> void:
	deck_component.play(0)
	deck_component.finish_hand()


func _on_coin_2_button_pressed() -> void:
	deck_component.play(1)
	deck_component.finish_hand()


func _on_coin_3_button_pressed() -> void:
	deck_component.play(2)
	deck_component.finish_hand()


func _on_deck_component_dealt(signal_hand) -> void:
	current_hand = signal_hand
	if coins_hbox:
		coins_hbox.player_hand = signal_hand
