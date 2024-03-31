extends Area2D

@onready var unlock = false

func _on_body_entered(_body):
	#Pause Game and Start Typing Sequence
	get_tree().paused = true
	const UNLOCK = preload("res://items/unlock.tscn")
	var unlock_overlay = UNLOCK.instantiate()
	unlock_overlay.chest = self
	get_parent().add_child(unlock_overlay)
	
func _exit_tree():
	#Spawn Item if unlock true
	if unlock:
		const ITEM = preload("res://items/item.tscn")
		var item = ITEM.instantiate()
		item.global_position = self.global_position
		get_parent().add_child.call_deferred(item)
	
	
