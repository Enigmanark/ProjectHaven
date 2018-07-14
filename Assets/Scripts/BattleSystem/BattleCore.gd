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

var enemyhud;
var playerhud;

func _ready():
	var player = get_node("Player/PlayerStats");
	var enemy = get_node("GreenSlime/EnemyStats");
	playerhud = get_parent().get_node("HUD/PlayerHUD");
	enemyhud = get_parent().get_node("HUD/EnemyHUD");
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
	update_enemy_hud();
	update_player_hud();

func update_enemy_hud():
	var hpp = (float(enemyCurrentHP) / float(enemyHP)) * float(100);
	var spp = (float(enemyCurrentSP) / float(enemySP)) * float(100);
	var mpp = (float(enemyCurrentMP) / float(enemyMP)) * float(100);
	enemyhud.get_node("EnemyHPBar").value = hpp
	enemyhud.get_node("EnemySPBar").value = spp;
	enemyhud.get_node("EnemyMPBar").value = mpp;
	
func update_player_hud():
	var hpp = (float(playerCurrentHP) / float(playerHP)) * float(100);
	var spp = (float(playerCurrentSP) / float(playerSP)) * float(100);
	var mpp = (float(playerCurrentMP) / float(playerMP)) * float(100);
	playerhud.get_node("PlayerHPBar").value = hpp;
	playerhud.get_node("PlayerSPBar").value = spp;
	playerhud.get_node("PlayerMPBar").value = mpp;

func do_player_attack():
	enemyCurrentHP -= playerDamage;
	update_enemy_hud();
	if enemyCurrentHP <= 0:
		print("You win!");
	else:
		print(str(enemyCurrentHP) + "/" + str(enemyHP));
