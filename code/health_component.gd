class_name HealthComponent
extends Node

# basically this is just a component that can be added to any scene which dies or takes damage

# emits these signals (that's all you really need to know)
signal die
signal take_damage
signal health_changed(value: float)

@export var starting_health: int = 20
@export var max_health: int = 20

var current_health:
	set(new_value):
		var took_dmg = false
		# if new value is less than the current health take damage signal
		if current_health:
			if new_value < current_health:
				took_dmg = true
		# sets the value like normal
		current_health = min(new_value, max_health)
		health_changed.emit(current_health)
		# signal emitted after setting current_health
		if took_dmg:
			take_damage.emit()
		# emits a signal if entity runs out of health
		if current_health <= 0:
			die.emit()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = starting_health
