extends Node


signal action_performed(action: String)


# variables
# list of all possible coins. Might not end up needing this
const ALL_POSSIBLE_COINS = []

var rng := RandomNumberGenerator.new()
var player_deck_size
var player_discard_size


func push_action(act: String) -> void:
	action_performed.emit(act)


## Returns the health component of a given node (will error if there are none). 
## Health components are expected to be called "HealthComponent" because I'm
## lazy ;).
static func get_health_component(node: Node) -> HealthComponent:
	return node.get_node("HealthComponent")
