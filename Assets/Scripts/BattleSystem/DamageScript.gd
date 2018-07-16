extends Label

var damage;
var element;
var speed = 30;

func _ready():
	text = str(damage);
	if element == "Earth":
		get_node("Element").texture = load("res://Assets/Art/Sprites/attack_earth.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_earth.wav");
		get_node("AudioStreamPlayer").play();
	elif element == "Fire":
		get_node("Element").texture = load("res://Assets/Art/Sprites/attack_fire.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_fire.wav");
		get_node("AudioStreamPlayer").play();
	elif element == "Ice":
		get_node("Element").texture = load("res://Assets/Art/Sprites/attack_ice.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_ice.wav");
		get_node("AudioStreamPlayer").play();
	elif element == "Dark":
		get_node("Element").texture = load("res://Assets/Art/Sprites/attack_dark.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_dark.wav");
		get_node("AudioStreamPlayer").play();

func _process(delta):
	rect_position = Vector2(rect_position.x, rect_position.y - (speed * delta));

func _on_Timeout_timeout():
	queue_free();
