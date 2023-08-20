extends Node2D

func _ready() -> void:
	for child in $Enemies.get_children():
		child.enemy_died.connect(_on_enemy_died)

func _on_enemy_died():
	$CanvasLayer/UI/ChoiceSceneCoin.show()
