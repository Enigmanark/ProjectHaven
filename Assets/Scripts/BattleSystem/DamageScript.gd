extends Label

var damage;
var speed = 30;

func _ready():
	text = str(damage);

func _process(delta):
	rect_position = Vector2(rect_position.x, rect_position.y - (speed * delta));

func _on_Timeout_timeout():
	queue_free();
