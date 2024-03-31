extends CanvasLayer

var parent
var chest

func _ready():
	parent = get_parent()
	#Only grab focus after player releases WASD keys
	%LineEdit.grab_focus()
	
func open_the_gates():
	#Play FAIL
	chest.free() 
	queue_free()
	get_tree().paused = false
	#Spawn Daunting Number of Mobs
	for i in range(100):
		if parent.has_method("spawn_mob"):
			parent.spawn_mob()
		else:
			print("Opening the Gates!")

func _on_timer_timeout():
	open_the_gates()


func _on_line_edit_text_changed(new_text):
	var string_size = new_text.length()
	var count = %Label.text.count(new_text, 0, string_size)
	if count == 0:
		#Play FAIL sound
		open_the_gates()
		return
	
	if new_text.length() == %Label.text.length():
		#Instantiate Weapon (3 Guns, Sword, Bomb)
		chest.unlock = true
		chest.free()
		queue_free()
		get_tree().paused = false
		
