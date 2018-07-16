extends Node2D

var playerStats;
var enemyStats;

var enemyName;
var enemyMaxHP;
var enemyCurHP;
var enemyMaxSP;
var enemyCurSP;
var enemyMaxMP;
var enemyCurMP;
var enemyMinDamage;
var enemyMaxDamage;
var enemyMeleeDef;
var enemyRangedDef;
var enemySpellDef;

var enemyhud;
var playerhud;

var victory = false;
var battlePhase = false;

var baseAccuracy = 95;

func _ready():
	randomize();
	playerStats = get_parent().get_node("/root/PlayerStats");
	playerhud = get_parent().get_node("HUD/PlayerHUD");
	enemyhud = get_parent().get_node("HUD/EnemyHUD");
	enemyStats = get_parent().get_node("/root/CurrentBattle");
	init_enemy_battle_vars();
	update_enemy_hud();
	get_node("../HUD/PlayerHUD").update_player_hud(playerStats);

func update_enemy_hud():
	var hpp = (float(enemyCurHP) / float(enemyMaxHP)) * float(100);
	var spp = (float(enemyCurSP) / float(enemyMaxSP)) * float(100);
	var mpp = (float(enemyCurMP) / float(enemyMaxMP)) * float(100);
	enemyhud.get_node("EnemyHPBar").value = hpp
	enemyhud.get_node("EnemySPBar").value = spp;
	enemyhud.get_node("EnemyMPBar").value = mpp;
	enemyhud.get_node("EnemyHPBar/HPText").text = str(enemyCurHP) + "/" + str(enemyMaxHP);
	enemyhud.get_node("EnemySPBar/SPText").text = str(enemyCurSP) + "/" + str(enemyMaxSP);
	enemyhud.get_node("EnemyMPBar/MPText").text = str(enemyCurMP) + "/" + str(enemyMaxMP);

func do_enemy_attack():
	var floatDSc = load("res://Assets/Prefabs/BattleSystem/FloatingDamage.tscn");
	var damage = calculate_enemy_damage();
	var floatD = floatDSc.instance();
	floatD.damage = damage;
	get_node("Player").add_child(floatD);
	playerStats.currentHP -= damage;
	get_node("../HUD/PlayerHUD").update_player_hud(get_parent().get_node("/root/PlayerStats"));

func do_player_attack():
	var floatDSc = load("res://Assets/Prefabs/BattleSystem/FloatingDamage.tscn");
	var damage = calculate_player_damage();
	enemyCurHP -= damage;
	var floatD = floatDSc.instance();
	floatD.damage = damage;
	get_node("GreenSlime").add_child(floatD);
	if(enemyCurHP <= 0):
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

func calculate_enemy_damage():
	var baseD = rand_range(enemyStats.minDamage, enemyStats.maxDamage);
	return int(baseD);

func calculate_player_damage():
	var baseD = rand_range(playerStats.minDamage, playerStats.maxDamage);
	print("Base Damage is:" + str(baseD));
	var strength = playerStats.currentStrength;
	#convert to decimal
	var dec = str("0." + str(strength));
	var mod = float(dec) * strength;
	print("Mod is:" + str(mod));
	var moddedD = mod + baseD;
	return int(moddedD);

func init_enemy_battle_vars():
	enemyName = enemyStats._name;
	enemyMaxHP = enemyStats.maxHP;
	enemyCurHP = enemyMaxHP;
	enemyMaxSP = enemyStats.maxSP;
	enemyCurSP = enemyMaxSP;
	enemyMaxMP = enemyStats.maxMP;
	enemyCurMP = enemyMaxMP;
	enemyMinDamage = enemyStats.minDamage;
	enemyMaxDamage = enemyStats.maxDamage;
	enemyMeleeDef = enemyStats.meleeDef;
	enemyRangedDef = enemyStats.rangedDef;
	enemySpellDef = enemyStats.spellDef;

func _on_ReturnButton_pressed():
	get_node("/root/BattleSceneManager").return_to_haven();
