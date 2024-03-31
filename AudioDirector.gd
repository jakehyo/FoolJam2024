extends Node

var isCalm: bool = true

var prevFadeInProgress: bool = false

func _ready():
	%MusicCalm.set_volume_db(0.0)
	%MusicIntense.set_volume_db(-90.0)


func _on_game_set_music_calm():
	if not isCalm and not prevFadeInProgress:
		isCalm = true
		prevFadeInProgress = true
		fadein(%MusicCalm)
		await fadeout(%MusicIntense)
		prevFadeInProgress = false


func _on_game_set_music_intense():
	if isCalm and not prevFadeInProgress:
		isCalm = false
		prevFadeInProgress = true
		fadein(%MusicIntense)
		await fadeout(%MusicCalm)
		prevFadeInProgress = false
		

func fadeout(stream_to_fade: AudioStreamPlayer):
	while stream_to_fade.volume_db > -90.0:
		stream_to_fade.volume_db -= 0.2
		await get_tree().create_timer(0.001).timeout

func fadein(stream_to_fade: AudioStreamPlayer):
	while stream_to_fade.volume_db < 0.0:
		stream_to_fade.volume_db += 1.0
		await get_tree().create_timer(0.001).timeout
