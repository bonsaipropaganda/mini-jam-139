extends Control

var deck_owner
var opponent

func flip():
	var side = Global.rng.randi_range(0,1)
	if side == 0:
		action_1()
	else:
		action_2()


func action_1():
	print("hooray, action 1!")

func action_2():
	print("hooray, action 2!")
