extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

#func _input(event):
	#if event is InputEventMouseMotion:
		#position = event.position - Vector2(0, 16)

func _physics_process(_delta):
	%Cursor.position = get_viewport().get_mouse_position() - (Vector2(get_viewport().size.x, get_viewport().size.y) / 2)
	%Gun.look_at(%Cursor.global_position)
