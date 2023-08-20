## Applies all the specified actions
class_name MultiAction
extends Action

## All the actions to do
@export var actions: Array[Action] = []


func apply(source: Node, destination: Node) -> void:
	for act in actions:
		act.apply(source, destination)
