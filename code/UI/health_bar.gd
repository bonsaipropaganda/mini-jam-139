extends TextureProgressBar


@export var target_entity: Node:
	set(value):
		target_entity = value
		
		if not target_entity.is_node_ready():
			await tree_entered
			await get_tree().process_frame
		
		target = target_entity.get_node("HealthComponent")
		if target:
			set_health(100.0 * target.starting_health / target.max_health)
			target.health_changed.connect(func(_v):
				change_health(100.0 * target.current_health / target.max_health)
			)

@export_group("Animation")
@export var setup_time: float = 0.1
@export var animation_time: float = 0.25
@export var gradient: Gradient


var tween: Tween
var target: HealthComponent


func _ready() -> void:
	value_changed.connect(func(v):
		tint_progress = gradient.sample(v * 0.01)
		tint_progress.a = 100.0 / 255.0
	)
	$CurrentHealth.value_changed.connect(func(v):
		$CurrentHealth.tint_progress = gradient.sample(v * 0.01)
	)


## Animate the health change
## proportion is the new percent health that should be displayed
func change_health(proportion: float) -> void:
	if tween:
		tween.kill()
	
	tween = create_tween()
	
	if value > proportion:
		tween.tween_property(self, ^"value", proportion, animation_time)
		tween.parallel().tween_property($CurrentHealth, ^"value", proportion, setup_time)
	else:
		tween.tween_property(self, ^"value", proportion, setup_time)
		tween.parallel().tween_property($CurrentHealth, ^"value", proportion, animation_time)


func set_health(proportion: float) -> void:
	if tween:
		tween.kill()
	
	value = proportion
	$CurrentHealth.value = proportion
