extends Node2D

var toTrain;
var cost;

func _ready():
	var playerStats = get_node("/root/PlayerStats");
	if playerStats.trainingPoints >= 1:
		get_node("Scene/TrainingWindow/Background/ChooseStat").visible = true;
	else:
		get_node("Scene/TrainingWindow/Background/DontHaveEnough").visible = true;

func get_cost(attribute):
	if attribute < 20:
		return attribute * 30;
	elif attribute < 50:
		return attribute * 50;
	elif attribute < 75:
		return attribute * 60;
	elif attribute < 90:
		return attribute * 70;
	elif attribute < 100:
		return attribute * 100;

func show_payrequired_window():
	if(toTrain == "Strength"):
		var newStrength = get_node("/root/PlayerStats").get_strength() + 5;
		cost = get_cost(newStrength);
		var message = "Training Strength to " + str(newStrength) + " will cost " + str(
			cost) + " Gold.";
		get_node("Scene/TrainingWindow/Background/ToPay/PayMessage").text = message;
		get_node("Scene/TrainingWindow/Background/ToPay").visible = true;
	elif(toTrain == "Dexterity"):
		var newDexterity = get_node("/root/PlayerStats").get_dexterity() + 5;
		cost = get_cost(newDexterity);
		var message = "Training Dexterity to " + str(newDexterity) + " will cost " + str(
			cost) + " Gold.";
		get_node("Scene/TrainingWindow/Background/ToPay/PayMessage").text = message;
		get_node("Scene/TrainingWindow/Background/ToPay").visible = true;
	elif(toTrain == "Endurance"):
		var newEndurance = get_node("/root/PlayerStats").get_endurance() + 5;
		cost = get_cost(newEndurance);
		var message = "Training Endurance to " + str(newEndurance) + " will cost " + str(
			cost) + " Gold.";
		get_node("Scene/TrainingWindow/Background/ToPay/PayMessage").text = message;
		get_node("Scene/TrainingWindow/Background/ToPay").visible = true;
	elif(toTrain == "Intelligence"):
		var newIntelligence = get_node("/root/PlayerStats").get_intelligence() + 5;
		cost = get_cost(newIntelligence);
		var message = "Training Intelligence to " + str(newIntelligence) + " will cost " + str(
			cost) + " Gold.";
		get_node("Scene/TrainingWindow/Background/ToPay/PayMessage").text = message;
		get_node("Scene/TrainingWindow/Background/ToPay").visible = true;
	elif(toTrain == "Willpower"):
		var newWillpower = get_node("/root/PlayerStats").get_willpower() + 5;
		cost = get_cost(newWillpower);
		var message = "Training Willpower to " + str(newWillpower) + " will cost " + str(
			cost) + " Gold.";
		get_node("Scene/TrainingWindow/Background/ToPay/PayMessage").text = message;
		get_node("Scene/TrainingWindow/Background/ToPay").visible = true;

func setup_strength():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Strength"] += 5;
	get_node("/root/Global").trainingStat = "Strength";
	get_node("/root/Global").trainingCost = cost;
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");

func setup_dexterity():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Dexterity"] += 5;
	get_node("/root/Global").trainingStat = "Dexterity";
	get_node("/root/Global").trainingCost = cost;
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");

func setup_endurance():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Endurance"] += 5;
	alyonis["MeleeDef"] = 40;
	alyonis["RangedDef"] = 40;
	alyonis["SpellDef"] = 40;
	get_node("/root/Global").trainingStat = "Endurance";
	get_node("/root/Global").trainingCost = cost;
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");	

func setup_intelligence():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Intelligence"] += 5;
	alyonis["MeleeDef"] = 50;
	alyonis["RangedDef"] = 50;
	get_node("/root/Global").trainingStat = "Intelligence";
	get_node("/root/Global").trainingCost = cost;
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");	

func setup_willpower():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Willpower"] += 5;
	alyonis["MeleeDef"] = 50;
	alyonis["RangedDef"] = 50;
	get_node("/root/Global").trainingStat = "Willpower";
	get_node("/root/Global").trainingCost = cost;
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");	

func setup_cunning():
	var playerStats = get_node("/root/PlayerStats");
	var alyonis = get_base_alyonis_battle(playerStats.level);
	alyonis = apply_damage_level(playerStats.level, alyonis);
	alyonis = apply_trainer_stats(playerStats, alyonis);
	alyonis["Cunning"] += 5;
	alyonis["MeleeDef"] = 25;
	alyonis["RangedDef"] = 25;
	alyonis["SpellDef"] = 50;
	get_node("/root/Global").trainingStat = "Cunning";
	get_node("/root/Global").trainingCost = cost;
	get_node("/root/BattleSceneManager").do_battle(alyonis,
		"res://Assets/Scenes/Training/Training_Reward.tscn");	

func _on_ChooseStrength_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	toTrain = "Strength";
	show_payrequired_window();
	
func _on_Dexterity_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	toTrain = "Dexterity";
	show_payrequired_window();

func _on_Endurance_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	toTrain = "Endurance";
	show_payrequired_window();

func _on_Intelligence_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	toTrain = "Intelligence";
	show_payrequired_window();

func _on_Willpower_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	toTrain = "Willpower";
	show_payrequired_window();

func _on_Cunning_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	toTrain = "Cunning";
	show_payrequired_window();

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

func _on_Return_pressed():
	get_node("/root/BattleSceneManager").go_home();

func _on_TrainButton_pressed():
	if(toTrain == "Strength"):
		setup_strength();
	elif(toTrain == "Dexterity"):
		setup_dexterity();
	elif(toTrain == "Endurance"):
		setup_endurance();
	elif(toTrain == "Intelligence"):
		setup_intelligence();
	elif(toTrain == "Willpower"):
		setup_willpower();
	elif(toTrain == "Cunning"):
		setup_cunning();
	
func _on_CancelButton_pressed():
	get_node("Scene/TrainingWindow/Background/ToPay").visible = false;
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = true;


func _on_CancelTrainingButton_pressed():
	get_node("/root/BattleSceneManager").go_home();
