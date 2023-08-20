class_name BattleField
extends Node2D


signal start_player_turn()
signal end_player_turn()

signal encounter_ended()


var player: Node
var enemy : Node


var is_player_turn: bool = true


func _play_action(act: Action) -> void:
	var turn_signal: Signal
	
	# Do the action
	if is_player_turn:
		act.apply(player, enemy)
		player.do_action.disconnect(_play_action)
		enemy.do_action.connect(_play_action)
		turn_signal = end_player_turn
	else:
		act.apply(enemy, player)
		enemy.do_action.disconnect(_play_action)
		player.do_action.connect(_play_action)
		turn_signal = start_player_turn
	
	is_player_turn = not is_player_turn
	turn_signal.emit()



func set_enemy(enemy_scene: PackedScene) -> void:
	var new_enemy: Enemy = enemy_scene.instantiate()
	
	if not is_player_turn:
		if enemy: enemy.do_action.disconnect(_play_action)
		new_enemy.do_action.connect(_play_action)
	
	if enemy: enemy.queue_free()
	enemy = new_enemy
	enemy.enemy_died.connect(func(): encounter_ended.emit())
	end_player_turn.connect(enemy.play_turn)
	$EnemyLocation.add_child(enemy)
	
	%EnemyHealthBar.target_entity = enemy


func set_player(p: Node2D) -> void:
	player = p
	player.do_action.connect(_play_action)
	$PlayerLocation.add_child(player)
	player.coins_hbox = $UI/UI/CoinsHBox # Oof this piece of code hurts, but this is a jam lol
	
	%PlayerHealthBar.target_entity = player
	
	%Coin1Button.pressed.connect(player.play_coin.bind(0))
	%Coin2Button.pressed.connect(player.play_coin.bind(1))
	%Coin3Button.pressed.connect(player.play_coin.bind(2))
