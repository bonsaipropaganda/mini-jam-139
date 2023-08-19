class_name Enemy
extends Sprite2D


const NullAction := preload("res://code/combat/actions/action.gd")


signal do_action(action: Action)


@onready var health_component = $HealthComponent


func play_turn() -> void:
	do_action.emit(NullAction.new())

