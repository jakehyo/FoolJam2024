extends AudioStreamPlayer

@export var startStream: AudioStream
@export var loopStream: AudioStream

var hasLooped: bool
var playbackPos: float

# Called when the node enters the scene tree for the first time.
func _ready():
	self.stream = startStream
	self.play(0)



func _physics_process(delta):
	if not hasLooped:
		playbackPos = self.get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()
		if startStream.get_length() - playbackPos <= AudioServer.get_time_to_next_mix():
				self.stream = loopStream
				self.play(0)
				hasLooped = true
