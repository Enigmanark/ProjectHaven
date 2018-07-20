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

var enemyInst;

var enemyhud;
var playerhud;

var victory = false;
var battlePhase = false;

var currentBattle;

func _ready():
	randomize();
	playerStats = get_parent().get_node("/root/PlayerStats");
	playerhud = get_parent().get_node("HUD/PlayerHUD");
	enemyhud = get_parent().get_node("HUD/EnemyHUD");
	enemyStats = get_parent().get_node("/root/CurrentBattle");
	load_enemy();
	get_node("../HUD/PlayerHUD").update_player_hud();
	init_enemy_avatar();

func load_enemy():
	var enemy_x = get_node("Foe/Enemy").position.x;
	var enemy_y = get_node("Foe/Enemy").position.y;
	get_node("Foe/Enemy").queue_free();
	var enemySc = load(get_node("/root/CurrentBattle").path);
	var inst = enemySc.instance();
	inst.add_to_group("Enemy");
	get_node("Foe").add_child(inst);
	init_enemy_battle_vars();
	update_enemy_hud();
	for object in get_node("Foe").get_children():
		if object.is_in_group("Enemy"):
			enemyInst = object;
	enemyInst.position = Vector2(enemy_x, enemy_y);

func update_enemy_hud():
	var hpp = (float(enemyCurHP) / float(enemyMaxHP)) * float(100);
	var spp = (float(enemyCurSP) / float(enemyMaxSP)) * float(100);
	var mpp = (float(enemyCurMP) / float(enemyMaxMP)) * float(100);
	enemyhud.get_node("Stats/NameBackground/Name").text = enemyName;
	enemyhud.get_node("Stats/EnemyHPBar").value = hpp
	enemyhud.get_node("Stats/EnemySPBar").value = spp;
	enemyhud.get_node("Stats/EnemyMPBar").value = mpp;
	enemyhud.get_node("Stats/EnemyHPBar/HPText").text = str(enemyCurHP) + "/" + str(enemyMaxHP);
	enemyhud.get_node("Stats/EnemySPBar/SPText").text = str(enemyCurSP) + "/" + str(enemyMaxSP);
	enemyhud.get_node("Stats/EnemyMPBar/MPText").text = str(enemyCurMP) + "/" + str(enemyMaxMP);

func do_enemy_attack():
	var floatDSc = load("res://Assets/Prefabs/BattleSystem/FloatingDamage.tscn");
	if calculate_if_hit("Melee", enemyStats, playerStats):	
		var baseDamage = int(calculate_enemy_damage());
		var damage = int(calculate_element_damage(enemyStats.attackElement, baseDamage, playerStats));
		var floatD = floatDSc.instance();
		floatD.damage = damage;
		floatD.element = enemyStats.attackElement;
		get_node("Player").add_child(floatD);
		playerStats.currentHP -= damage;
		get_node("../HUD/PlayerHUD").update_player_hud();
	else:
		var miss = floatDSc.instance();
		miss.damage = "Miss!";
		get_node("Player").add_child(miss);

func calculate_element_damage(element, damage, defender):
	if(element == "Earth"):
		return damage * defender.earth;
	elif(element == "Water"):
		return damage * defender.water;
	elif(element == "Air"):
		return damage * defender.air;
	elif(element == "Fire"):
		return damage * defender.fire;
	elif(element == "Water"):
		return damage * defender.water;
	elif(element == "Ice"):
		return damage * defender.ice;
	elif(element == "Thunder"):
		return damage * defender.thunder;
	elif(element == "Light"):
		return damage * defender.light;
	elif(element == "Dark"):
		return damage * defender.dark;

func calculate_if_hit(attackType, attacker, defender):
	var def;
	var baseAcc;
	var bonusAcc;
	var accuracy;
	var aD = attacker.get_dexterity();
	if(attackType == "Melee"):
		def = defender.get_meleeDef();
		baseAcc = 95;
		bonusAcc = aD / 10
		accuracy = (baseAcc + bonusAcc) - def;
	elif attackType == "Ranged":
		def = defender.get_rangedDef();
		baseAcc = 95;
		bonusAcc = aD / 10
		accuracy = (baseAcc + bonusAcc) - def;
	var roll = rand_range(1, 100);
	if roll <= accuracy:
		return true;
	else:
		return false;

func do_player_attack():
	var floatDSc = load("res://Assets/Prefabs/BattleSystem/FloatingDamage.tscn");
	if calculate_if_hit("Melee", playerStats, enemyStats):
		var baseDamage = calculate_player_damage();
		var element = playerStats.get_weapon()["Element"];
		var damage = int(calculate_element_damage(element, baseDamage, enemyStats));
		enemyCurHP -= damage;
		var floatD = floatDSc.instance();
		floatD.damage = damage;
		floatD.element = element;
		enemyInst.add_child(floatD);
		if(enemyCurHP <= 0):
			enemyInst.get_node("AttackLogic").kill();
		update_enemy_hud();
	else:
		var miss = floatDSc.instance();
		miss.damage = "Miss!";
		enemyInst.add_child(miss);

#Overarching battle logic
func _process(delta):		
	var enemyLogic = enemyInst.get_node("AttackLogic");
	var enemyMove = enemyInst;
	#If we're in the battlephase, this is started from InitateAttack.gd
	if battlePhase:
		#If player is in start position
		if get_node("Player/MoveAndAttack").inStartPosition:
			#If enemy is in start position
			if enemyMove.inStartPosition:
				#If the enemy is alive
				if enemyLogic.alive:
					#If the enemy did it's attack
					if enemyLogic.didAttack:
						#Turn off battle phase and did attack
						battlePhase = false;
						enemyLogic.didAttack = false;
			#Or if the enemy is not attacking, has not done it's attack, and we're still in battle
					elif !enemyLogic.attacking and !enemyLogic.didAttack and battlePhase:
						#Make the enemy do it's attack
						enemyLogic.attack();
				#The enemy isn't alive, turn off battle phase
				else:
					battlePhase = false;
	#If we haven't won yet and it's not in a battle phase
	if !victory and !battlePhase:
		#If the enemy is dead and the player is in start position
		if !enemyLogic.alive and get_node("Player/MoveAndAttack").inStartPosition:
			#Show victory screen
			victory = true;
			get_node("../BattleMenu").visible = false;
			get_node("../VictoryGUI").visible = true;
			setup_victory_window();
			get_reward();

#Damage calculation for the enemy
func calculate_enemy_damage():
	var baseD = rand_range(enemyStats.minDamage, enemyStats.maxDamage);
	return int(baseD);

#Damage calculation for the player
func calculate_player_damage():
	var minDamage = playerStats.get_weapon()["MinDamage"];
	var maxDamage = playerStats.get_weapon()["MaxDamage"];
	var baseD = rand_range(minDamage, maxDamage + 1);
	var strength = playerStats.currentStrength;
	#convert to decimal
	var dec = str("0." + str(strength));
	var mod = float(dec) * strength;
	var moddedD = mod + baseD;
	return int(moddedD);

#Gets the enemy battle vars from enemystats for easy access
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

func init_enemy_avatar():
	var x_pos = get_parent().get_node("HUD/EnemyHUD/Avatar").position.x;
	var y_pos = get_parent().get_node("HUD/EnemyHUD/Avatar").position.y;
	get_parent().get_node("HUD/EnemyHUD/Avatar").queue_free();
	var newAvatarScene = load(get_node("/root/CurrentBattle").pathToAvatar);
	var newAvatar = newAvatarScene.instance();
	newAvatar.position = Vector2(x_pos, y_pos);
	get_parent().get_node("HUD/EnemyHUD").add_child(newAvatar);

func setup_victory_window():
	get_parent().get_node("VictoryGUI/VictoryWindow/EXP").text = str(enemyStats.experience) + " Experience!";
	get_parent().get_node("VictoryGUI/VictoryWindow/Gold").text = str(enemyStats.gold) + " Gold!";

func get_reward():
	if playerStats.add_experience(enemyStats.experience):
		var floatDSc = load("res://Assets/Prefabs/BattleSystem/FloatingDamage.tscn");
		var floatD = floatDSc.instance();
		floatD.damage = "Level Up!";
		get_node("Player").add_child(floatD);
	playerStats.add_gold(enemyStats.gold);
	get_parent().get_node("HUD/PlayerHUD/Avatar/StatWindow").update_stats();
	get_parent().get_node("HUD/PlayerHUD").update_player_hud();
	
func _on_ReturnButton_pressed():
	get_node("/root/BattleSceneManager").go_to_next_scene();

func _on_Flee_pressed():
	get_node("/root/BattleSceneManager").go_home();
