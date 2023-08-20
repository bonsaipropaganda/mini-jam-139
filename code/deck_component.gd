class_name DeckComponent
extends Node


signal dealt
signal do_action(action: Action)


# this is the whole player deck
@export var coins: Array[Coin]
# this will be all of the coin scenes instanced
var deck_coins  : Array[Coin] = []
var discard_pile: Array[Coin] = []
var current_hand: Array[Coin] = []

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
	deck_coins.append_array(coins)
	
	var parent: Node = get_parent()
	if parent.has_signal("do_action"):
		do_action.connect(func(act): parent._play_action(act.duplicate(true)))


func _enter_tree() -> void:
	await get_tree().process_frame
	deal()


func _process(delta: float) -> void:
	if current_hand.is_empty():
		deal()
	if len(deck_coins) < 3:
		shuffle_discard_in()


func shuffle():
	deck_coins.shuffle()


func deal():
	shuffle()
	for i in hand_size:
		current_hand.append(deck_coins.pop_front())
	dealt.emit(current_hand)


func reset_deck():
	discard_pile.append_array(current_hand)
	current_hand.clear()
	deck_coins.append_array(discard_pile)
	discard_pile.clear()
	shuffle()
	deal()


func play(coin):
	if current_hand:
		do_action.emit(current_hand[coin].flip())
	else: print("empty hand")


func finish_hand():
	discard_pile.append_array(current_hand)
	current_hand = []
	deal()


func shuffle_discard_in():
	deck_coins.append_array(discard_pile)
	discard_pile = []
	shuffle()


func add_coin(coin: Coin) -> void:
	deck_coins.push_back(coin)
