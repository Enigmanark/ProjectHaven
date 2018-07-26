extends Node2D

var damage;
var type;
var element;
var speed = 25;
var critical = false;

func _ready():
	if(str(damage) == "Miss!"):
		get_node("Type").text = "";
		get_node("Text").text = str(damage);
		get_node("Element").visible = false;
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/miss.wav");
		get_node("AudioStreamPlayer").volume_db = -3;
		get_node("AudioStreamPlayer").play();
		return;
	elif(str(damage) == "Level Up!"):
		get_node("Type").text = "";
		get_node("Text").text = str(damage);
		get_node("Element").visible = false;
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_light.wav");
		get_node("AudioStreamPlayer").volume_db = 0;
		get_node("AudioStreamPlayer").play();
		return;
	else:
		if(critical):
			get_node("Type").text = type;
			get_node("Text").text = str(damage) + "!!";
			get_node("Type").add_color_override("font_color", ColorN("yellow", 1));
			get_node("Text").add_color_override("font_color", ColorN("yellow", 1));
		else:
			get_node("Type").text = type;
			get_node("Text").text = str(damage) + " ";
			get_node("Type").add_color_override("font_color", ColorN("white", 1));
			get_node("Text").add_color_override("font_color", ColorN("white",1));
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
		get_node("AudioStreamPlayer").stream = load("res://Assets/Audio/attack_wind.wav");
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
