extends Node


signal start_player_turn()
signal end_player_turn()


@export var player: Node
@export var enemy : Node


var is_player_turn: bool = true


func _ready() -> void:
	player.do_action.connect(_play_action)


func set_enemy(new_enemy: Node) -> void:
	if not is_player_turn:
		enemy.do_action.disconnect(_play_action)
		new_enemy.do_action.connect(_play_action)
	enemy = new_enemy


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
