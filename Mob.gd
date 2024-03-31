extends CharacterBody2D

signal on_mob_death

var health = 3
@onready var player = get_node("/root/Game/Player")

var onRight

func _ready():
	%Mob.play_walk()
	onRight = global_position.x - player.global_position.x >= 0.0
	if !onRight:
		%Mob.flip()
	
func _process(_delta):
	if global_position.x - player.global_position.x < 0.0 && onRight:
		onRight = false
		%Mob.flip()
	
	if global_position.x - player.global_position.x >= 0.0 && !onRight:
		onRight = true
		%Mob.flip()
	

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage(amount):
	health -= amount
	%Mob.play_hurt()
	if health <= 0:
		on_mob_death.emit()
		%SFX.play_sound(%SFX.cancel)
		queue_free()
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
