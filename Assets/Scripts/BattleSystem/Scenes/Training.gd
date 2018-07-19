extends Node2D

func _ready():
	pass;

func _on_ChooseStrength_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Strength"] += 5;
	get_node("/root/Global").trainingStat = "Strength";
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");
	
func _on_Dexterity_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Dexterity"] += 5;
	get_node("/root/Global").trainingStat = "Dexterity";
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");

func _on_Endurance_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Endurance"] += 5;
	alyonis["MeleeDef"] = 40;
	alyonis["RangedDef"] = 40;
	alyonis["SpellDef"] = 40;
	get_node("/root/Global").trainingStat = "Endurance";
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");

func _on_Intelligence_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Intelligence"] += 5;
	alyonis["MeleeDef"] = 50;
	alyonis["RangedDef"] = 50;
	get_node("/root/Global").trainingStat = "Intelligence";
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");

func _on_Willpower_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Willpower"] += 5;
	alyonis["MeleeDef"] = 50;
	alyonis["RangedDef"] = 50;
	get_node("/root/Global").trainingStat = "Willpower";
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");

func _on_Cunning_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Cunning"] += 5;
	alyonis["MeleeDef"] = 25;
	alyonis["RangedDef"] = 25;
	alyonis["SpellDef"] = 50;
	get_node("/root/Global").trainingStat = "Cunning";
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");

func apply_trainer_stats(playerStats, trainer):
	trainer["Strength"] = playerStats.strength;
	trainer["Dexterity"] = playerStats.dexterity;
	trainer["Endurance"] = playerStats.endurance;
	trainer["Intelligence"] = playerStats.intelligence;
	trainer["Willpower"] = playerStats.willpower;
	trainer["Cunning"] = playerStats.cunning;
	return trainer;

func apply_damage_level(playerLevel, trainer):
	if playerLevel < 10:
		return trainer;
	elif playerLevel < 20:
		trainer["MinDamage"] = 8;
		trainer["MaxDamage"] = 15;
		return trainer;
	elif playerLevel < 30:
		trainer["MinDamage"] = 10;
		trainer["MaxDamage"] = 20;
		return trainer;

func get_base_alyonis_battle(playerLevel):
	var alyonis = {};
	alyonis["Level"] = playerLevel+1;
	alyonis["Experience"] = 0;
	alyonis["Gold"] = 0;
	alyonis["MaxHP"] = 75;
	alyonis["Path"] = "res://Assets/Prefabs/BattleSystem/Enemies/Training/Alyonis_Battle.tscn";
	alyonis["PathToAvatar"] = "res://Assets/Prefabs/GUI/Avatars/AvatarTrainerAlyonis.tscn";
	alyonis["Name"] = "Alyonis";
	alyonis["ID"] = -1;
	alyonis["MaxSP"] = 25;
	alyonis["MaxMP"] = 25;
	alyonis["MeleeDef"] = 10;
	alyonis["RangedDef"] = 10;
	alyonis["SpellDef"] = 10;
	alyonis["Strength"] = 1;
	alyonis["Dexterity"] = 1;
	alyonis["Endurance"] = 1;
	alyonis["Intelligence"] = 1;
	alyonis["Willpower"] = 1;
	alyonis["Cunning"] = 1;
	alyonis["MinDamage"] = 2;
	alyonis["MaxDamage"] = 8;
	alyonis["AttackElement"] = "Light";
	alyonis["Earth"] = 1;
	alyonis["Water"] = 1;
	alyonis["Air"] = 1;
	alyonis["Fire"] = 1;
	alyonis["Ice"] = 1;
	alyonis["Thunder"] = 1;
	alyonis["Light"] = 1;
	alyonis["Dark"] = 1;
	return alyonis;
