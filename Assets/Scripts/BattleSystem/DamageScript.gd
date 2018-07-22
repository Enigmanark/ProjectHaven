extends Node2D

var damage;
var element;
var speed = 25;

func _ready():
	get_node("Text").text = str(damage);
	if(str(damage) == "Miss!"):
		get_node("Element").visible = false;
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/miss.wav");
		get_node("AudioStreamPlayer").volume_db = -3;
		get_node("AudioStreamPlayer").play();
		return;
	elif(str(damage) == "Level Up!"):
		get_node("Element").visible = false;
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_light.wav");
		get_node("AudioStreamPlayer").volume_db = 0;
		get_node("AudioStreamPlayer").play();
		return;
	if element == "Earth":
		get_node("Element").texture = load("res://Assets/Art/Sprites/Battle/attack_earth.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_earth.wav");
		get_node("AudioStreamPlayer").volume_db = 0;
		get_node("AudioStreamPlayer").play();
	elif element == "Fire":
		get_node("Element").texture = load("res://Assets/Art/Sprites/Battle/attack_fire.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_fire.wav");
		get_node("AudioStreamPlayer").volume_db = 0;
		get_node("AudioStreamPlayer").play();
	elif element == "Ice":
		get_node("Element").texture = load("res://Assets/Art/Sprites/Battle/attack_ice.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_ice.ogg");
		get_node("AudioStreamPlayer").volume_db = 0;
		get_node("AudioStreamPlayer").play();
	elif element == "Dark":
		get_node("Element").texture = load("res://Assets/Art/Sprites/Battle/attack_dark.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_dark.wav");
		get_node("AudioStreamPlayer").volume_db = -5;
		get_node("AudioStreamPlayer").play();
	elif element == "Light":
		get_node("Element").texture = load("res://Assets/Art/Sprites/Battle/attack_light.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_light.wav");
		get_node("AudioStreamPlayer").volume_db = 0;
		get_node("AudioStreamPlayer").play();
	elif element == "Air":
		get_node("Element").texture = load("res://Assets/Art/Sprites/Battle/attack_air.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_air.wav");
		get_node("AudioStreamPlayer").volume_db = 0;
		get_node("AudioStreamPlayer").play();
	elif element == "Thunder":
		get_node("Element").texture = load("res://Assets/Art/Sprites/Battle/attack_thunder.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_thunder.wav");
		get_node("AudioStreamPlayer").volume_db = 0;
		get_node("AudioStreamPlayer").play();
	elif element == "Water":
		get_node("Element").texture = load("res://Assets/Art/Sprites/Battle/attack_water.png");
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_water.wav");
		get_node("AudioStreamPlayer").volume_db = 0;
		get_node("AudioStreamPlayer").play();

func _process(delta):
	position = Vector2(position.x, position.y - (speed * delta));

func _on_Timeout_timeout():
	queue_free();
