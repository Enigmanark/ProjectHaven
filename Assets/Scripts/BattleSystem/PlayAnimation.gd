extends AnimationPlayer

export(String) var animName;
var doPlay = true;

func _ready():
	play(animName);
	
func _process(delta):
	if doPlay:
		if(!is_playing()):
			play(animName);	