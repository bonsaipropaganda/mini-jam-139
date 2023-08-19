class_name ActionDealDamage
extends Action


@export var amount: int = 2


func apply(source: Node, destination: Node) -> void:
	var health: HealthComponent = get_health_component(destination)
	health.current_health -= amount
	
	Global.last_action = "%s dealt %s damage to %s" % [source.name, amount, destination.name]
