extends CharacterBody2D


signal do_action(action: Action)


# node refs
@onready var coins_hbox = $"../CanvasLayer/UI/CoinsHBox"
@onready var deck_component: DeckComponent = $DeckComponent

var current_hand = []


@export var opponent: Node2D:
	# if the opponent changes update the deck's opponent variable
	set(new_value):
		opponent = new_value
		$DeckComponent.opponent = opponent


func play_coin(idx: int) -> void:
	deck_component.play(idx)
	deck_component.finish_hand()


func _on_deck_component_dealt(signal_hand) -> void:
	current_hand = signal_hand
	if coins_hbox:
		coins_hbox.player_hand = signal_hand


func _on_deal_button_pressed() -> void:
	deck_component.deal()
