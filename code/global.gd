extends Node


signal action_performed(action: String)


# list of all possible coins. Might not end up needing this
const ALL_POSSIBLE_COINS = []

var rng := RandomNumberGenerator.new()


func push_action(act: String) -> void:
	action_performed.emit(act)
