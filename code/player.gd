extends CharacterBody2D

# node refs
@onready var health_component = $HealthComponent
@onready var coins_hbox = $"../CanvasLayer/UI/CoinsHBox"
@onready var deck_component = $DeckComponent

var current_hand = []

@export var opponent: TextureRect:
	# if the opponent changes update the deck's opponent variable
	set(new_value):
		opponent = new_value
		$DeckComponent.opponent = opponent

func _on_coin_1_button_pressed() -> void:
	deck_component.play(0)


func _on_coin_2_button_pressed() -> void:
	deck_component.play(1)


func _on_coin_3_button_pressed() -> void:
	deck_component.play(2)


func _on_deck_component_dealt(signal_hand) -> void:
	current_hand = signal_hand
	if coins_hbox:
		coins_hbox.player_hand = signal_hand


func _on_deal_button_pressed() -> void:
	deck_component.deal()
