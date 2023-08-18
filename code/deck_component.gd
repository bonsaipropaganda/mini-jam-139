extends Node

# determines who is playing the cards and against who
@export var deck_owner: Node2D
var opponent:
	# if the opponent changes update the coins' opponent variable
	set(new_value):
		opponent = new_value
		for coin in deck_coins:
			coin.opponent = opponent
var hand_size = 3

# this will be all of the coins in this deck
@export var deck_coins = []
var current_hand = []
var discard_pile = []

func _ready() -> void:
	for coin in deck_coins:
		coin.deck_owner = deck_owner
		coin.opponent = opponent
	shuffle()
	deal()

func shuffle():
	var new_order = []
	for coin in deck_coins:
		# re orders list of coins
		var to_take_index = Global.rng.randi_range(0,len(deck_coins))
		var coin_to_add = deck_coins.pop_at(to_take_index)
		new_order.append(coin_to_add)
	deck_coins = new_order

func deal():
	for i in hand_size:
		current_hand.append(deck_coins.pop_front())

func reset_deck():
	discard_pile.append_array(current_hand)
	current_hand.clear()
	deck_coins.append_array(discard_pile)
	discard_pile.clear()
	shuffle()
	deal()

func play(coin):
	current_hand[coin].flip()
