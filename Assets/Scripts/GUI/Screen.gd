extends Node2D

var transitionTimer = 0;
var transitionTime = 1;
var messageTimer = 0;
var messageDelay = 0.1;
var startTransition = true;
var startShowMessage = false;
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
	elif(startShowMessage):
		messageTimer += delta;
		if(messageTimer >= messageDelay):
			startShowMessage = false;
			emit_signal("MessageShown");

func show_message(message):
	get_node("LoadingBackground").visible = true;
	get_node("LoadingBackground/LoadingText").text = message;
	startShowMessage = true;
	
func hide_message():
	get_node("LoadingBackground").visible = false;

func _on_Timer_timeout():
	startTransition = true;
