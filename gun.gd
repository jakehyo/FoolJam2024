extends Area2D

@export var bullets_per_shot = 10
@export var shoot_cooldown = 1.0
@export var spread = 0.5
@export var bullet_speed = 1000.0
@export var bullet_range = 1000.0
@export var bullet_damage = 1

var time_since_last_shot = 1.0

func _process(delta):
	if Input.is_action_pressed("primary_fire") and time_since_last_shot >= shoot_cooldown:
		time_since_last_shot = 0.0
		shoot()
	time_since_last_shot += delta

func shoot():
	for i in range(0, bullets_per_shot):
		const BULLET = preload("res://bullet.tscn")
		var new_bullet = BULLET.instantiate()
		new_bullet.SPEED = bullet_speed
		new_bullet.RANGE = bullet_range
		new_bullet.DAMAGE = bullet_damage
		new_bullet.global_position = %ShootingPoint.global_position
		new_bullet.global_rotation = %ShootingPoint.global_rotation + randf_range(-spread, spread)
		%ShootingPoint.add_child(new_bullet)
