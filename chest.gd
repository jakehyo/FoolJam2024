extends Area2D


func _on_body_entered(body):
	if body.has_method("open_chest"):
		body.open_chest()
	