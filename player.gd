extends CharacterBody2D

signal health_depleted

var health = 100.0

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600.0
	move_and_slide()
	if !%Slime.is_hurt():
		if velocity.length() > 0.0:
			%Slime.play_walk()
		else:
			%Slime.play_idle()
	
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * _delta
		%ProgressBar.value = health
		if !%Slime.is_hurt():
			%Slime.play_hurt()
		if health <= 0.0:
			health_depleted.emit()

func open_chest():
	#Pause Game and Start Typing Sequence
	get_tree().paused = true
	const UNLOCK = preload("res://unlock.tscn")
	var unlock_overlay = UNLOCK.instantiate()
	get_parent().add_child(unlock_overlay)
