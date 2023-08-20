class_name Action
extends Resource


## This function is called by the combat manager when an action is performed
## source      - the action caster
## destination - the target of the action
## In the interest of time, actions that do something on the one doing it (such
## as heals) will act on the source and ignore the fact that the other variable
## is called "destination". (I think it'll be too complicated to create a
## targeting system with the time left in the jam :)
func apply(source: Node, destination: Node) -> void:
	Global.push_action("%s tried to do something but it failed" % [source.name])

