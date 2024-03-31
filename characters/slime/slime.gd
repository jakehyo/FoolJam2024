extends Node2D


func play_walk():
	%AnimationPlayer.play("walk")

func play_idle():
	%AnimationPlayer.play("idle")

func play_hurt():
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")

func is_hurt():
	print(%AnimationPlayer.assigned_animation)
	return %AnimationPlayer.assigned_animation == "hurt"
	

