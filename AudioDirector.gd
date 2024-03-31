extends Node

var isCalm: bool = true

signal fadeOutComplete
signal fadeInComplete

var fadeOutInProg: bool = false
var fadeInProg: bool = false

func _ready():
	%MusicCalm.set_volume_db(0.0)
	%MusicIntense.set_volume_db(-90.0)


func _on_game_set_music_calm():
	if fadeInProg:
		await fadeInComplete
	if fadeOutInProg:
		await fadeOutComplete
	if not isCalm:
		isCalm = true
		fadein(%MusicCalm)
		fadeout(%MusicIntense)


func _on_game_set_music_intense():
	if fadeInProg:
		await fadeInComplete
	if fadeOutInProg:
		await fadeOutComplete
	if isCalm:
		isCalm = false
		fadein(%MusicIntense)
		fadeout(%MusicCalm)
		

func fadeout(stream_to_fade: AudioStreamPlayer):
	fadeOutInProg = true
	while stream_to_fade.volume_db > -90.0:
		stream_to_fade.volume_db -= 0.2
		await get_tree().create_timer(0.001).timeout
	fadeOutInProg = false
	fadeOutComplete.emit()

func fadein(stream_to_fade: AudioStreamPlayer):
	fadeInProg = true
	while stream_to_fade.volume_db < 0.0:
		stream_to_fade.volume_db += 1.2
		await get_tree().create_timer(0.001).timeout
	fadeInProg = false
	fadeInComplete.emit()
