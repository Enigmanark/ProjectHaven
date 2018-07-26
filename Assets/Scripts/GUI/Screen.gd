extends Node2D

var transitionTimer = 0;
var transitionTime = 1;
var startTransition = true;

func _ready():
	pass;

func _process(delta):
	transitionTimer += delta;
	get_node("Blackout").modulate.a -= delta;
	if(transitionTimer >= transitionTime):
		transitionTimer = 0;
		startTransition = false;
		get_node("Blackout").visible = false;

func _on_Timer_timeout():
	startTransition = true;
