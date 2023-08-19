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

func action_2():
	opponent.health_component.current_health -= 1
