class_name ActionBurn
extends Action


const Burn := preload("res://scenes/status_effects/burn.tscn")

@export var damage: int = 1
@export var duration: int = 4


func apply(source: Node, destination: Node) -> void:
	var burn := Burn.instantiate()
	burn.damage = damage
	burn.duration = duration
	destination.add_status_effect(burn)
	
	Global.push_action("%s burned %s" % [source.name, destination.name])
