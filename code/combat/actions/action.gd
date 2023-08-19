class_name Action
extends Resource


func apply(source: Node, destination: Node) -> void:
	Global.last_action = "%s tried to do something but it failed" % [source.name]


static func get_health_component(node: Node) -> HealthComponent:
	return node.get_node_or_null("HealthComponent")

