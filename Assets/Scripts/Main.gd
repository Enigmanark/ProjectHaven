extends Node

func _ready():
	if(OS.get_name() == "HTML5" or OS.get_name() == "X11" or OS.get_name() == "Windows"):
		get_viewport().set_size_override(true, Vector2(1024, 768));
		get_viewport().set_size_override_stretch(true);
		OS.window_size = Vector2(1024, 768);
	elif(OS.get_name() == "Android"):
		print("Is Android, changing orientation to portrait")
		OS.set_screen_orientation(OS.SCREEN_ORIENTATION_PORTRAIT);
		
func set_orientation():
	if(OS.get_name() == "Android"):
		print("Is Android, changing orientation to landscape")
		OS.set_screen_orientation(OS.SCREEN_ORIENTATION_LANDSCAPE);