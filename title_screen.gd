extends Control


func _on_button_button_up():
	#Play Confirm Sound
	%SFX.play_sound(%SFX.confirm)
	get_tree().change_scene_to_file("res://fooljamgame.tscn")

