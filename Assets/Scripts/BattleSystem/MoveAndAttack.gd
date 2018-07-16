extends Node2D

var inStartPosition = false;
var movingBack = false;
var isMovingRight = false;
var isMovingLeft = false;
var timer = 0;
export(float) var timeToMove = 1;
var inPosition = false;
var playedAttackAnim = false;

func _ready():
	pass

#Moving logic for the battle scene for the player
func _process(delta):
	#Move right to get into attack position
	if isMovingRight:
		get_node("AnimationPlayer").doPlay = false;
		if(get_node("AnimationPlayer").current_animation != "player_idle"):
			if(!playedAttackAnim):
				get_node("AnimationPlayer").play("player_attack");
				playedAttackAnim = true;
			position = Vector2(position.x + (float(180) * delta), position.y);
			timer += delta;
			if timer >= timeToMove:
				isMovingRight = false;
				inPosition = true;
				timer = 0;
	#Move back to start position
	elif isMovingLeft:
		position = Vector2(position.x - (float(180) * delta), position.y);
		timer += delta;
		if timer >= timeToMove:
			isMovingLeft = false;
			inStartPosition = true;
			get_node("AnimationPlayer").play("player_idle");
			get_node("AnimationPlayer").doPlay = true;
			timer = 0;
#Called from initiateattack.gd to start the attack sequence
func move_and_attack():
	isMovingRight = true;
	inStartPosition = false;
	inPosition = false;

func move_left():
	playedAttackAnim = false;
	isMovingLeft = true;
	inPosition = false;
	inStartPosition = false;