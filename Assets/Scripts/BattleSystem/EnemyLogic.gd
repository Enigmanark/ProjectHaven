extends Node2D

var attacking = false;
var movingBack = false;
var didAttack = false;
var alive = true;
var player;
var attackWaitTimer = 0;
var attackWaitTime = 0.65;
var battleCore;
var enemyMove;

func _ready():
	battleCore = get_parent().get_parent();
	enemyMove = get_parent();
	
func attack():
	attacking = true;
	enemyMove.move_and_attack();

func kill():
	alive = false;
	
func _process(delta):
	if attacking:
		if enemyMove.inPosition:
			if !didAttack:
				battleCore.do_enemy_attack();
				didAttack = true;
			attackWaitTimer += delta;
			if attackWaitTimer >= attackWaitTime:
				attackWaitTimer = 0;
				enemyMove.move_Right();
				attacking = false;
				enemyMove.inPosition = false;
				movingBack = true;