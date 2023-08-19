extends CharacterBody2D

@export var opponent: Node2D:
	# if the opponent changes update the deck's opponent variable
	set(new_value):
		opponent = new_value
		$DeckComponent.opponent = opponent


func _on_coin_1_button_pressed() -> void:
	$DeckComponent.play(0)


func _on_coin_2_button_pressed() -> void:
	$DeckComponent.play(1)


func _on_coin_3_button_pressed() -> void:
	$DeckComponent.play(2)
