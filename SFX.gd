extends Node

@export var cancel: AudioStream
@export var confirm: AudioStream
@export var select: AudioStream
@export var gunshot: AudioStream
@export var powerup: AudioStream
@export var fail: AudioStream
@export var death: AudioStream


func play_sound(sound: AudioStream):
	sound.instantiate_playback()
