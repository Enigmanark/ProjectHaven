extends Node2D

var cost;

func _ready():
	var playerStats = get_node("/root/PlayerStats");
	if playerStats.player["TrainingPoints"] >= 1:
		get_node("Scene/TrainingWindow/Background/ChooseStat").visible = true;
	else:
		get_node("Scene/TrainingWindow/Background/DontHaveEnough").visible = true;

func get_cost(attribute):
	if attribute < 20:
		cost = attribute * 30;
		get_node("/root/Global").trainingCost = cost;
		return cost;
	elif attribute < 50:
		cost = attribute * 50;
		get_node("/root/Global").trainingCost = cost;
		return cost;
	elif attribute < 75:
		cost = attribute * 60;
		get_node("/root/Global").trainingCost = cost;
		return cost;
	elif attribute < 90:
		cost = attribute * 70;
		get_node("/root/Global").trainingCost = cost;
		return cost;
	elif attribute < 100:
		cost = attribute * 100;
		get_node("/root/Global").trainingCost = cost;
		return cost;

func show_payrequired_window():
	var toTrain = get_node("/root/Global").trainingStat;
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
	elif(toTrain == "Agility"):
		var newAgility = get_node("/root/PlayerStats").get_agility() + 5;
		cost = get_cost(newAgility);
		var message = "Training Agility to " + str(newAgility) + " will cost " + str(
			cost) + " Gold.";
		get_node("Scene/TrainingWindow/Background/ToPay/PayMessage").text = message;
		get_node("Scene/TrainingWindow/Background/ToPay").visible = true;


func _on_ChooseStrength_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	get_node("/root/Global").trainingStat = "Strength";
	show_payrequired_window();
	
func _on_Dexterity_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	get_node("/root/Global").trainingStat = "Dexterity";
	show_payrequired_window();

func _on_Endurance_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	get_node("/root/Global").trainingStat = "Endurance";
	show_payrequired_window();

func _on_Intelligence_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	get_node("/root/Global").trainingStat = "Intelligence";
	show_payrequired_window();

func _on_Willpower_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	get_node("/root/Global").trainingStat = "Willpower";
	show_payrequired_window();

func _on_Agility_pressed():
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = false;
	get_node("/root/Global").trainingStat = "Agility";
	show_payrequired_window();

func _on_Return_pressed():
	get_node("/root/BattleSceneManager").go_home();

func _on_TrainButton_pressed():
	get_node("/root/NetworkBattleManager").get_training();
	yield(get_node("/root/NetworkBattleManager"), "got_battle"); 
	var battle = get_node("/root/NetworkBattleManager").battle;
	var nextScene = battle["NextScene"];
	get_node("/root/BattleSceneManager").do_battle(battle, nextScene);
	
func _on_CancelButton_pressed():
	get_node("Scene/TrainingWindow/Background/ToPay").visible = false;
	get_node("Scene/TrainingWindow/Background/ChooseStat").visible = true;


func _on_CancelTrainingButton_pressed():
	get_node("/root/BattleSceneManager").go_home();
