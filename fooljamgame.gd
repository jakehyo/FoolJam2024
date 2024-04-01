extends Node2D

var mobCount: int = 0
var mobs = [preload("res://Mobs/wolf/wolfmob.tscn"),preload("res://Mobs/vulture/vulturemob.tscn"),preload("res://Mobs/golem/ruingolemmob.tscn")]
@export var intenseMusicMobCount: int = 15

signal set_music_intense
signal set_music_calm

func _process(_delta):
	%TimeDisplay.text = str(%WorldTime.time_left).pad_decimals(0)
	pass

func _physics_process(_delta):
	if Input.is_action_just_pressed("key_exit") && !get_tree().paused:
		get_tree().paused = true
		%PauseScreen.visible = true


func spawn_mob():
	#Spawn different mobs using different scenes and rand function
	var index = randi_range(0,2)
	var new_mob = mobs[index].instantiate()
	mobCount += 1
	if mobCount >= intenseMusicMobCount:
		set_music_intense.emit()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	new_mob.on_mob_death.connect(_on_mob_death)
	


func _on_timer_timeout():
	spawn_mob()
	pass


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
	%SFX.play_sound(%SFX.death)
	%AudioDirector.stopAllMusic()

func _on_mob_death():
	mobCount -= 1
	if mobCount < intenseMusicMobCount:
		set_music_calm.emit()

