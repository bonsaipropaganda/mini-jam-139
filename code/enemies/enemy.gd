class_name Enemy
extends Sprite2D


const NullAction := preload("res://code/combat/actions/action.gd")


signal do_action(action: Action)


@onready var health_component = $HealthComponent


func play_turn() -> void:
	await get_tree().create_timer(0.5).timeout
	do_action.emit(NullAction.new())

