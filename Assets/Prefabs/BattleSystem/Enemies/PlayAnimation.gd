extends Sprite

export(String) var animName;

func _ready():
	get_node("/AnimationPlayer").play(animName);
	

