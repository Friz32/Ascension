extends Node

func audio_play(stream: AudioStream) -> void:
	var audio = AudioStreamPlayer.new()
	audio.stream = stream
	audio.connect("finished", self, "audio_finished", [audio])
	get_tree().root.add_child(audio)
	audio.play()

func audio_finished(node: Node) -> void:
	node.queue_free()
