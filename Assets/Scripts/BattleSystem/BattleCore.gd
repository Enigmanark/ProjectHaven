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
var playerDamage;
var enemyDamage;

var enemyhud;
var playerhud;

var victory = false;
var battlePhase = false;

func _ready():
	var player = get_parent().get_node("/root/PlayerStats");
	playerhud = get_parent().get_node("HUD/PlayerHUD");
	enemyhud = get_parent().get_node("HUD/EnemyHUD");
	playerHP = player.maxhp;
	playerCurrentHP = player.currentHP;
	playerMP = player.maxmp;
	playerCurrentMP = player.currentMP;
	playerSP = player.maxsp;
	playerCurrentSP = player.currentSP;
	playerDamage = player.damage;
	
	var enemy = get_parent().get_node("/root/CurrentBattle");
	enemyHP = enemy.maxHP;
	enemyCurrentHP = enemyHP;
	enemyMP = enemy.maxMP;
	enemyCurrentMP = enemyMP;
	enemySP = enemy.maxMP;
	enemyCurrentSP = enemyMP;
	enemyDamage = enemy.damage;
	update_enemy_hud();
	get_node("../HUD/PlayerHUD").update_player_hud(player);

func update_enemy_hud():
	var hpp = (float(enemyCurrentHP) / float(enemyHP)) * float(100);
	var spp = (float(enemyCurrentSP) / float(enemySP)) * float(100);
	var mpp = (float(enemyCurrentMP) / float(enemyMP)) * float(100);
	enemyhud.get_node("EnemyHPBar").value = hpp
	enemyhud.get_node("EnemySPBar").value = spp;
	enemyhud.get_node("EnemyMPBar").value = mpp;
	enemyhud.get_node("EnemyHPBar/HPText").text = str(enemyCurrentHP) + "/" + str(enemyHP);
	enemyhud.get_node("EnemySPBar/SPText").text = str(enemyCurrentSP) + "/" + str(enemySP);
	enemyhud.get_node("EnemyMPBar/MPText").text = str(enemyCurrentMP) + "/" + str(enemyMP);

func update_playerStats():
	var player = get_parent().get_node("/root/PlayerStats");
	player.maxhp = playerHP;
	player.currentHP = playerCurrentHP;
	player.maxmp = playerMP;
	player.currentMP = playerCurrentMP;
	player.maxsp = playerSP;
	player.currentSP = playerCurrentSP;
	player.damage = playerDamage;

func do_enemy_attack():
	playerCurrentHP -= enemyDamage;
	update_playerStats();
	get_node("../HUD/PlayerHUD").update_player_hud(get_parent().get_node("/root/PlayerStats"));

func do_player_attack():
	enemyCurrentHP -= playerDamage;
	if(enemyCurrentHP <= 0):
		get_node("GreenSlime/AttackLogic").kill();
	update_enemy_hud();

func _process(delta):
	var enemyLogic = get_node("GreenSlime/AttackLogic");
	var enemyMove = get_node("GreenSlime");
	if battlePhase:
		if get_node("Player").inStartPosition:
			if enemyMove.inStartPosition:
				if enemyLogic.alive:
					if enemyLogic.didAttack:
						battlePhase = false;
						enemyLogic.didAttack = false;
					elif !enemyLogic.attacking and !enemyLogic.didAttack and battlePhase:
						enemyLogic.attack();
				else:
					battlePhase = false;
	if !victory and !battlePhase:
		if !enemyLogic.alive and get_node("Player").inStartPosition:
			victory = true;
			get_node("../BattleMenu").visible = false;
			get_node("../VictoryGUI").visible = true;

func _on_ReturnButton_pressed():
	get_node("/root/BattleSceneManager").return_to_haven();
