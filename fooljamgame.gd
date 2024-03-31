extends Node2D

func _ready():
	#spawn_mob();
	#spawn_mob();
	#spawn_mob();
	#spawn_mob();
	#spawn_mob();
	pass

func spawn_mob():
	#Spawn different mobs using different scenes and rand function
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	#spawn_mob()
	pass


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
