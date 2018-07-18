extends TextureButton

var attacking = false;
var movingBack = false;
var didAttack = false;
var player;
var playerAttackNode;
var attackWaitTimer = 0;
var attackWaitTime = 0.65;
var battleCore;

func _ready():
	call_deferred("initialize");
	pass;

func attack():
	attacking = true;
	playerAttackNode.move_and_attack();
	get_parent().visible = false;
	didAttack = false;
	battleCore.battlePhase = true;
	
func _process(delta):
	if attacking:
		if playerAttackNode.inPosition:
			if !didAttack:
				get_parent().get_parent().get_node("Battle").do_player_attack();
				didAttack = true;
			attackWaitTimer += delta;
			if attackWaitTimer >= attackWaitTime:
				attackWaitTimer = 0;
				playerAttackNode.move_left();
				attacking = false;
				playerAttackNode.inPosition = false;
				movingBack = true;
	elif movingBack:
		if playerAttackNode.inStartPosition and !battleCore.victory and !battleCore.battlePhase:
			get_parent().visible = true;
		
func initialize():
	battleCore = get_node("../../Battle");
	playerAttackNode = get_node("../../Battle/Player/MoveAndAttack");
			
func _on_AttackButton_pressed():
	if !battleCore.victory:
		attack();
