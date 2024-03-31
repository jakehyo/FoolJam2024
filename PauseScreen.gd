extends CanvasLayer



func _on_return_button_pressed():
	%PauseScreen.visible = false
	get_tree().paused = false


func _on_exit_game_pressed():
	%SFX.play_sound(%SFX.confirm)
	get_tree().quit()
