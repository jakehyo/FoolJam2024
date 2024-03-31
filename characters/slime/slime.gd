extends Node2D


func play_walk():
	%AnimationPlayer.play("walk")

func play_idle():
	%AnimationPlayer.play("idle")

func play_hurt():
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")
	
func flip():
	var isflipped = %Body.flip_h
	%Body.flip_h = !isflipped
	
func is_hurt():
	return %AnimationPlayer.assigned_animation == "hurt"
	

