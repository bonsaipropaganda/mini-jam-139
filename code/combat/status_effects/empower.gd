class_name StatusEmpower
extends StatusEffect


@export var boost: int = 2


func _action_to_apply(act: Action) -> void:
	if act is ActionDealDamage:
		act.amount += boost
	elif act is ActionStrongDealDamage:
		act.amount += boost


func get_tooltip() -> String:
	return "Increases damage delt by %s" % [boost]
