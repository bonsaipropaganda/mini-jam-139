class_name CombatHistory
extends Container


@export var message_spacing: float = 5.0
@export var history_length: int = 6

@export var label_settings: LabelSettings


var history: Array[Label] = []


func _ready() -> void:
	Global.action_performed.connect(_on_action_performed)



func _on_action_performed(act: String) -> void:
	var msg := Label.new()
	msg.text = act
	msg.label_settings = label_settings
	
	if history.size() == history_length:
		var delete: Label = history.pop_front()
		delete.queue_free()
	
	add_child(msg)
	
	for lab in history:
		lab.position.y -= message_spacing + msg.size.y
	msg.position.y = size.y - msg.size.y
	
	history.push_back(msg)
