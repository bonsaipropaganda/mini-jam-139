class_name BurnStatus
extends StatusEffect


var damage: int = 1


func _turn_start() -> void:
	var parent: Node = get_parent()
	var hpc := Global.get_health_component(parent)
	hpc.current_health -= damage
	Global.push_action("%s took %s burn damage" % [parent.name, damage])


func get_tooltip() -> String:
	return "Burns for %s damage each turn" % [damage]
