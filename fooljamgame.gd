extends Node2D

var mobCount: int = 0
@export var intenseMusicMobCount: int = 15

signal set_music_intense
signal set_music_calm

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
	mobCount += 1
	if mobCount >= intenseMusicMobCount:
		set_music_intense.emit()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	new_mob.on_mob_death.connect(_on_mob_death)
	


func _on_timer_timeout():
	#spawn_mob()
	pass


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true

func _on_mob_death():
	mobCount -= 1
	if mobCount < intenseMusicMobCount:
		set_music_calm.emit()
