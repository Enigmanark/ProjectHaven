extends TextureButton

var attacking = false;
var movingBack = false;
var didAttack = false;
var player;
var attackWaitTimer = 0;
var attackWaitTime = 0.65;

func _ready():
	player = get_parent().get_parent().get_node("Battle/Player");
	
func attack():
	attacking = true;
	player.move_and_attack();
	get_parent().visible = false;
	didAttack = false;
	
func _process(delta):
	if attacking:
		if player.inPosition:
			if !didAttack:
				get_parent().get_parent().get_node("Battle").do_player_attack();
				didAttack = true;
			attackWaitTimer += delta;
			if attackWaitTimer >= attackWaitTime:
				attackWaitTimer = 0;
				player.move_left();
				attacking = false;
				player.inPosition = false;
				movingBack = true;
	elif movingBack:
		if player.inPosition:
			get_parent().visible = true;
			
func _on_AttackButton_pressed():
	attack();
