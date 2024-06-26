extends CharacterBody2D

signal health_depleted

var health = 100.0
@export var speed = 600.0
@export var damage_rate = 10.0

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	if !%Slime.is_hurt():
		if velocity.length() > 0.0:
			%Slime.play_walk()
		else:
			%Slime.play_idle()
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= damage_rate * overlapping_mobs.size() * _delta
		%ProgressBar.value = health
		if !%Slime.is_hurt():
			%Slime.play_hurt()
		if health <= 0.0:
			health_depleted.emit()
	
