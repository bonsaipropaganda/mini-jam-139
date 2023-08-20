extends TextureProgressBar

func _ready() -> void:
	# shows a decorative sprite whether it's the player or not
	if target_entity:
		$YourHealth.hide()
		$EnemyIndicator.show()
	else:
		$YourHealth.show()
		$EnemyIndicator.hide()

@export var target_entity: Node:
	set(value):
		target_entity = value
		
		if not target_entity.is_node_ready():
			await tree_entered
			await get_tree().process_frame
		
		target = target_entity.get_node("HealthComponent")
		if target:
			set_health(100.0 * target.current_health / target.max_health)
			target.health_changed.connect(func(_v):
				change_health(100.0 * target.current_health / target.max_health)
			)

@export_group("Animation")
@export var setup_time: float = 0.1
@export var animation_time: float = 0.25
@export var gradient: Gradient


var tween: Tween
var target: HealthComponent


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


func _on_value_changed(value: float) -> void:
	tint_progress = gradient.sample(value * 0.01)
	tint_progress.a = 100.0 / 255.0


func _on_current_health_value_changed(value: float) -> void:
	$CurrentHealth.tint_progress = gradient.sample(value * 0.01)
