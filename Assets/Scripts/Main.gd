extends Node

func _ready():
	if(OS.get_name() == "HTML5" or OS.get_name() == "X11"):
		get_viewport().set_size_override(true, Vector2(1024, 768));
		get_viewport().set_size_override_stretch(true);
		OS.window_size = Vector2(1024, 768);
