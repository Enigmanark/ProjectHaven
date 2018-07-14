extends AnimationPlayer

export(String) var animName;

func _ready():
	play(animName);