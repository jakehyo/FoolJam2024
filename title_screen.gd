extends Control


func _on_button_button_up():
	#Play Confirm Sound
	%SFX.play_sound(%SFX.confirm)
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://fooljamgame.tscn")

