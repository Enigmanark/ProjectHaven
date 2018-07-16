extends Label

var damage;
var element;
var speed = 25;

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
	elif element == "Light":
		get_node("Element").texture = load("res://Assets/Art/Sprites/attack_light.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_light.wav");
		get_node("AudioStreamPlayer").play();
	elif element == "Air":
		get_node("Element").texture = load("res://Assets/Art/Sprites/attack_air.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_air.wav");
		get_node("AudioStreamPlayer").play();
	elif element == "Thunder":
		get_node("Element").texture = load("res://Assets/Art/Sprites/attack_thunder.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_thunder.wav");
		get_node("AudioStreamPlayer").play();
	elif element == "Water":
		get_node("Element").texture = load("res://Assets/Art/Sprites/attack_water.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_water.wav");
		get_node("AudioStreamPlayer").play();

func _process(delta):
	rect_position = Vector2(rect_position.x, rect_position.y - (speed * delta));

func _on_Timeout_timeout():
	queue_free();
