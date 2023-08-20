class_name Lifesteal
extends Action


@export var amount: int = 4
@export var heal_amount: int = 2

	


func apply(source: Node, destination: Node) -> void:
	var health: HealthComponent = Global.get_health_component(destination)
	health.current_health -= amount
	var enemyhealth: HealthComponent = Global.get_health_component(source)
	enemyhealth.current_health += heal_amount
	
	Global.push_action("%s healed themselves %s hp" % [source.name, heal_amount])
	
	Global.push_action("%s dealt %s damage to %s" % [source.name, amount, destination.name])


	
