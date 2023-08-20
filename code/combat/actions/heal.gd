class_name ActionHeal
extends Action


@export var amount: int = 2


func apply(source: Node, destination: Node) -> void:
	var health: HealthComponent = Global.get_health_component(source)
	health.current_health += amount
	
	Global.push_action("%s healed themselves %s hp" % [source.name, amount])
