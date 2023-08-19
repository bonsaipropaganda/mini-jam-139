extends Control

var deck_owner
var opponent

func _ready() -> void:
	print(opponent)

func flip():
	var side = Global.rng.randi_range(0,1)
	if side == 0:
		action_1()
	else:
		action_2()


func action_1():
	opponent.health_component.current_health -= 3
	Global.last_action = str(deck_owner.name) + "dealt 3 damage to " + str(opponent)

func action_2():
	opponent.health_component.current_health -= 1
	Global.last_action = str(deck_owner.name) + "dealt 1 damage to " + str(opponent)
