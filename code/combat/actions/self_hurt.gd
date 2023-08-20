class_name ActionSelfHurt
extends Action


@export var amount: int = 2


func apply(source: Node, destination: Node) -> void:
	var health: HealthComponent = Global.get_health_component(source)
	health.current_health -= amount
	
	Global.push_action("%s harmed themselves loosing %s hp" % [source.name, amount])
