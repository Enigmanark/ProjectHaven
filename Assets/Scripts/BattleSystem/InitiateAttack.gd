extends TextureButton

var attacking = false;
var movingBack = false;
var didAttack = false;
var player;
var playerAttackNode;
var attackWaitTimer = 0;
var attackWaitTime = 0.7;
var battleCore;
var attack = "Single";
var attacks = 0;

func _ready():
	call_deferred("initialize");
	pass;

func attack():
	attacking = true;
	get_parent().visible = false;
	didAttack = false;
	battleCore.battlePhase = true;
	var agility = get_node("/root/PlayerStats").player["Agility"];
	var DAChance = agility * get_node("/root/Global").doubleAttackAgilityMod;
	var TAChance = agility * get_node("/root/Global").tripleAttackAgilityMod;
	
	var rand = rand_range(1, 101);
	rand = int(rand);
	if(rand <= TAChance):
		attack = "Triple";
		attacks = 3;
	elif(rand <= DAChance):
		attack = "Double";
		attacks = 2;
	else:
		attack = "Single";
		attacks = 1;
	
	playerAttackNode.attack = attack;
	playerAttackNode.move_and_attack();
	
func _process(delta):
	if attacking:
		if playerAttackNode.inPosition:
			if !didAttack:
				attacks -= 1;
				get_parent().get_parent().get_node("Battle").do_player_attack();
				didAttack = true;
			attackWaitTimer += delta;
			if attackWaitTimer >= attackWaitTime:
				if(attacks != 0):
					didAttack = false;
					attackWaitTimer = 0;
				else:
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
