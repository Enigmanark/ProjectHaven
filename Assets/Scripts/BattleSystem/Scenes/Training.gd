extends Node2D

func _ready():
	pass;

func _on_ChooseStrength_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Strength"] += 5;
	
func _on_Dexterity_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Dexterity"] += 5;

func _on_Endurance_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Endurance"] += 5;
	alyonis["MeleeDef"] = 40;
	alyonis["RangedDef"] = 40;
	alyonis["SpellDef"] = 40;

func _on_Intelligence_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Intelligence"] += 5;
	alyonis["MeleeDef"] = 50;
	alyonis["RangedDef"] = 50;

func _on_Willpower_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Willpower"] += 5;
	alyonis["MeleeDef"] = 50;
	alyonis["RangedDef"] = 50;

func _on_Cunning_pressed():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Cunning"] += 5;
	alyonis["MeleeDef"] = 25;
	alyonis["RangedDef"] = 25;
	alyonis["SpellDef"] = 50;

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
	enemy["Level"] = playerLevel+1;
	enemy["MaxHP"] = 75;
	enemy["Path"] = "res://Assets/Prefabs/Characters/Alyonis.tscn" ;
	enemy["Name"] = "Alyonis";
	enemy["ID"] = -1;
	enemy["MaxSP"] = 25;
	enemy["MaxMP"] = 25;
	enemy["MeleeDef"] = 10;
	enemy["RangedDef"] = 10;
	enemy["SpellDef"] = 10;
	enemy["Strength"] = 1;
	enemy["Dexterity"] = 1;
	enemy["Endurance"] = 1;
	enemy["Intelligence"] = 1;
	enemy["Willpower"] = 1;
	enemy["Cunning"] = 1;
	enemy["MinDamage"] = 2;
	enemy["MaxDamage"] = 8;
	enemy["AttackElement"] = "Light";
	enemy["Earth"] = 1;
	enemy["Water"] = 1;
	enemy["Air"] = 1;
	enemy["Fire"] = 1;
	enemy["Ice"] = 1;
	enemy["Thunder"] = 1;
	enemy["Light"] = 1;
	enemy["Dark"] = 1;
	return alyonis;
