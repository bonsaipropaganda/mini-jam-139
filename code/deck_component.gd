extends Node

# this will be all of the coin scenes in this deck
@export var deck_coin_scenes: Array[PackedScene]
# this will be all of the coin scenes instanced
var deck_coins = []
var current_hand = []
var discard_pile = []

# determines who is playing the cards and against who
@export var deck_owner: Node2D
var opponent:
	# if the opponent changes update the coins' opponent variable
	set(new_value):
		opponent = new_value
		for coin in deck_coins:
			coin.opponent = opponent
var hand_size = 3


func _ready() -> void:
	for scene in deck_coin_scenes:
		var coin_inst = scene.instantiate()
		deck_coins.append(coin_inst)
	for coin in deck_coins:
		coin.deck_owner = deck_owner
		coin.opponent = opponent
	shuffle()
	deal()

func shuffle():
	deck_coins.shuffle()

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
