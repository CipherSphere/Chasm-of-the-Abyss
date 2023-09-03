extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var layers = ["cello", "congas", "plucked", "percs", "piccolo", "pizzicato"]
	print(layers)
	for layer in layers:
		var resname = str("res://assets/audio/Layers ", layer, ".mp3")
		var music = AudioStreamPlayer.new()
		add_child(music);
		var stream = load(resname)
		music.set_stream(stream)
		music.volume_db = 1
		music.pitch_scale = 1
		music.play()
		print(str("added ", layer));


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
