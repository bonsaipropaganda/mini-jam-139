class_name ActionEmpower
extends Action


const Empower := preload("res://scenes/status_effects/empower.tscn")

@export var boost: int = 2
@export var duration: int = 3


func apply(source: Node, destination: Node) -> void:
	var empower := Empower.instantiate()
	empower.boost = boost
	empower.duration = duration
	source.add_status_effect(empower)
	
	Global.push_action("%s empowered themselves" % [source.name])
