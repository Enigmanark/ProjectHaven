extends TextureButton

var attacking = false;
var movingBack = false;
var player;
var attackWaitTimer = 0;
var attackWaitTime = 0.65;

func _ready():
	player = get_parent().get_parent().get_node("Battle/Player");
	
func attack():
	attacking = true;
	player.move_and_attack();
	visible = false;
	
func _process(delta):
	if attacking:
		if player.inPosition:
			attackWaitTimer += delta;
			if attackWaitTimer >= attackWaitTime:
				attackWaitTimer = 0;
				player.move_left();
				attacking = false;
				player.inPosition = false;
				movingBack = true;
	elif movingBack:
		if player.inPosition:
			visible = true;
			
func _on_AttackButton_pressed():
	attack();
