extends HBoxContainer

# node refs
@onready var coin_1_button = $Coin1Button
@onready var coin_2_button = $Coin2Button
@onready var coin_3_button = $Coin3Button

#var coin_buttons = [coin_1_button, coin_2_button, coin_3_button]
var player_hand = []:
	set(new_value):
		player_hand = new_value
		set_button_labels()


func set_button_labels():
	if player_hand[0]:
		coin_1_button.text = player_hand[0].name
	if player_hand[1]:
		coin_2_button.text = player_hand[1].name
	if player_hand[2]:
		coin_3_button.text = player_hand[2].name
