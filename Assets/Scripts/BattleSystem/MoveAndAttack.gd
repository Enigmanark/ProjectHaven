extends Sprite

var isMovingRight = false;
var isMovingLeft = false;
var timer = 0;
export(float) var timeToMove = 1;
var inPosition = false;

func _ready():
	pass
	
func _process(delta):
	if isMovingRight:
		position = Vector2(position.x + (float(180) * delta), position.y);
		timer += delta;
		if timer >= timeToMove:
			isMovingRight = false;
			inPosition = true;
			timer = 0;
	elif isMovingLeft:
		position = Vector2(position.x - (float(180) * delta), position.y);
		timer += delta;
		if timer >= timeToMove:
			isMovingLeft = false;
			inPosition = true;
			timer = 0;
			
func move_and_attack():
	get_node("AnimationPlayer").play("player_attack");
	isMovingRight = true;
	inPosition = false;
	
func move_left():
	isMovingLeft = true;
	inPosition = false;