extends Button

signal coin_selected(coin: Coin)


var coin: Coin:
	set(value):
		coin = value
		text = coin.coin_name
		tooltip_text = coin.description


func set_coin(c: Coin) -> void:
	coin = c


func _pressed() -> void:
	coin_selected.emit(coin)
