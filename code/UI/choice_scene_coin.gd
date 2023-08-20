extends Control


signal coin_selected(choice: Coin)


@export var possible_coins: Array[Coin] = []


func _ready() -> void:
	# pick a random one for each and make sure it's not the same coin
	var choice_1 = possible_coins.pick_random()
	var choice_2 = possible_coins.pick_random()
	while choice_1 == choice_2:
		choice_2 = possible_coins.pick_random()
	
	# setup the UI
	%Choice1Button.set_coin(choice_1)
	%Choice2Button.set_coin(choice_2)


func _select_coin(coin: Coin) -> void:
	coin_selected.emit(coin)
