class_name Coin
extends Resource


const NullAction := preload("res://code/combat/actions/action.gd")


@export var coin_name: String = ""
@export_multiline var description: String = ""
@export var head_image: Texture # TODO implement
@export var tail_image: Texture

@export var head_weight: float = 0.5 # To have biased coins ;)
@export var head_action: Action = NullAction.new()
@export var tail_action: Action = NullAction.new()


func flip() -> Action:
	if Global.rng.randf() <= head_weight:
		return head_action
	else:
		return tail_action
