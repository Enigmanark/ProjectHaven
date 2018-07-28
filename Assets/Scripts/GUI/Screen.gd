extends Node2D

var transitionTimer = 0;
var transitionTime = 1;
var startTransition = true;
signal MessageShown;

func _ready():
	get_node("Blackout").visible = true;

func _draw():
	yield(get_tree(), "idle_frame");

func _process(delta):
	if(startTransition):
		transitionTimer += delta;
		get_node("Blackout").modulate.a -= delta;
		if(transitionTimer >= transitionTime):
			transitionTimer = 0;
			startTransition = false;
			get_node("Blackout").visible = false;

func show_ok_message(message):
	get_node("LoadingBackground").visible = true;
	get_node("LoadingBackground/TextureButton/OkayText").visible = true;
	get_node("LoadingBackground/LoadingText").text = message;
	get_node("LoadingBackground/TextureButton").visible = true;

func show_message(message):
	get_node("LoadingBackground").visible = true;
	get_node("LoadingBackground/LoadingText").text = message;
	
func hide_message():
	get_node("LoadingBackground").visible = false;
	get_node("LoadingBackground/TextureButton/OkayText").visible = false;
	get_node("LoadingBackground/TextureButton").visible = false;

func _on_Timer_timeout():
	startTransition = true;


func _on_TextureButton_pressed():
	hide_message();
