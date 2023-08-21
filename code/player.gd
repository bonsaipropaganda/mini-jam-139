extends CharacterBody2D


signal player_died
signal do_action(action: Action)


# node refs
var coins_hbox: HBoxContainer
@onready var deck_component: DeckComponent = $DeckComponent

var current_hand = []


@export var opponent: Node2D:
	# if the opponent changes update the deck's opponent variable
	set(new_value):
		opponent = new_value
		$DeckComponent.opponent = opponent


func add_status_effect(effect: StatusEffect) -> void:
	add_child(effect)
	effect.position = Vector2(Global.rng.randf_range(-100, 100), Global.rng.randf_range(-100, 20))


func play_coin(idx: int) -> void:
	deck_component.play(idx)
	deck_component.finish_hand()
	update_deck_ui()


func _play_action(act: Action) -> void:
	# Apply to all status effects
	for c in get_children():
		if c is StatusEffect:
			c.action_to_apply(act)
	# Send action to be done
	do_action.emit(act)


func add_coin(coin: Coin) -> void:
	deck_component.add_coin(coin)


func _on_deck_component_dealt(signal_hand) -> void:
	current_hand = signal_hand
	if coins_hbox:
		coins_hbox.player_hand = signal_hand
	update_deck_ui()


func update_deck_ui():
	Global.player_deck_size = len(deck_component.deck_coins)
	Global.player_discard_size = len(deck_component.discard_pile)


#func _on_coin_choice_selected(choice) -> void:
#	deck_component.deck_coins.append(choice)


func _on_health_component_die() -> void:
	player_died.emit()


func _on_health_component_take_damage() -> void:
	$EntityAnimator.play("hurt")
	SfxManager.player_hurt.play()


func _turn_start() -> void:
	# Apply to all status effects
	for c in get_children():
		if c is StatusEffect:
			c.turn_start()


func _turn_end() -> void:
	# Apply to all status effects
	for c in get_children():
		if c is StatusEffect:
			c.turn_end()
func _on_player_died():
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")
