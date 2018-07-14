extends Node2D

var playerHP;
var playerCurrentHP;
var playerSP;
var playerCurrentSP;
var playerMP;
var playerCurrentMP;
var enemyHP;
var enemyCurrentHP;
var enemySP;
var enemyCurrentSP;
var enemyMP;
var enemyCurrentMP;

var playerDamage = 10;
var enemyDamage = 10;

func _ready():
	var player = get_node("Player/PlayerStats");
	var enemy = get_node("GreenSlime/EnemyStats");
	playerHP = player.hp;
	playerCurrentHP = playerHP;
	playerMP = player.mp;
	playerCurrentMP = player.mp;
	playerSP = player.sp;
	playerCurrentSP = player.sp;
	enemyHP = enemy.hp;
	enemyCurrentHP = enemy.hp;
	enemyMP = enemy.mp;
	enemyCurrentMP = enemy.mp;
	enemySP = enemy.sp;
	enemyCurrentSP = enemy.sp;
	
func do_player_attack():
	enemyCurrentHP -= playerDamage;
	if enemyCurrentHP <= 0:
		print("You win!");
	else:
		print(str(enemyCurrentHP) + "/" + str(enemyHP));
