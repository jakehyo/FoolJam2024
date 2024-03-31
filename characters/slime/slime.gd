extends Node2D


func play_walk():
	%AnimationPlayer.play("walk")

func play_idle():
	%AnimationPlayer.play("idle")

func play_hurt():
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")
	
func flip():
	var isflipped = %WolfBody.flip_h
	%WolfBody.flip_h = !isflipped
	
func is_hurt():
	return %AnimationPlayer.assigned_animation == "hurt"
	

