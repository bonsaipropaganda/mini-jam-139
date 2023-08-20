class_name Enemy
extends Sprite2D


const NullAction := preload("res://code/combat/actions/action.gd")


signal do_action(action: Action)
signal enemy_died


@export var possible_actions: Array[Action] = []
@export var weights: Array[float] = []


@onready var health_component = $HealthComponent


func play_turn() -> void:
	# Wait to make the combat history more legible
	await get_tree().create_timer(0.5).timeout
	
	# Make sure actions are setup properly
	if possible_actions.size() == 0:
		do_action.emit(NullAction.new())
	
	if possible_actions.size() != weights.size():
		push_error("Bad data: Enemy has %s possible actions and %s weights for them." %
					[possible_actions.size(), weights.size()])
	
	# Get total action weights
	var total_weight: float = 0.0
	for w in weights:
		total_weight += w
	
	# Select random action
	var rnd_act: float = total_weight * Global.rng.randf()
	var act_idx: int   = 0
	var curr_weight: float = 0.0
	for w in weights:
		curr_weight += w
		if rnd_act < curr_weight:
			break
		act_idx += 1
	
	do_action.emit(possible_actions[act_idx])


func _on_health_component_die() -> void:
	enemy_died.emit()
	queue_free()


func _on_health_component_take_damage() -> void:
	$EntityAnimator.play("hurt")
	SfxManager.enemy_hurt.play()
