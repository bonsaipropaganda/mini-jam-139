class_name StatusEffect
extends Sprite2D


@export var duration: int = 3


func _ready() -> void:
	$Tooltip.tooltip_text = get_full_tooltip()


func turn_start() -> void:
	_turn_start()
	duration -= 1
	if duration == 0:
		queue_free()
	
	$Tooltip.tooltip_text = get_full_tooltip()


func turn_end() -> void:
	_turn_end()


func action_to_apply(act: Action) -> void:
	_action_to_apply(act)


## Function to override.
## It is called when the creature's turn starts.
func _turn_start() -> void:
	pass


## Function to override.
## It is called when the creature's turn ends.
func _turn_end() -> void:
	pass


## Function to override.
## It is called when an action is about to be applied .
## It can be used to modify said action
func _action_to_apply(act: Action) -> void:
	pass


func get_tooltip() -> String:
	return "Placeholder status effect tooltip"


func get_full_tooltip() -> String:
	return "%s\n\n%s turns left" % [get_tooltip(), duration]
