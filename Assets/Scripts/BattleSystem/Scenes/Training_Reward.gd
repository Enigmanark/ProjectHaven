extends Node2D

func _ready():
	var stat = get_node("/root/Global").trainingStat;
	var cost = get_node("/root/Global").trainingCost;
	get_node("Scene/Background/Pay?/Message").text = "I require payment of " + str(
		cost) + " to increase your " + str(stat) + ".";
	get_node("Scene/Background/Pay?").visible = true;

func increase_stat_message():
	var stat = get_node("/root/Global").trainingStat;
	var playerStats = get_node("/root/PlayerStats");
	var messageText = get_node("Scene/Background/GetStat/Message");
	var statText = get_node("Scene/Background/GetStat/Message/Increase");
	if(stat == "Strength"):
			messageText.text = "Your Strength has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").player["Strength"]);
	elif(stat == "Dexterity"):
			messageText.text = "Your Dexterity has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").player["Dexterity"]);
	elif(stat == "Endurance"):
			messageText.text = "Your Endurance has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").player["Endurance"]);
	elif(stat == "Intelligence"):
			messageText.text = "Your Intelligence has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").player["Intelligence"]);
	elif(stat == "Willpower"):
			messageText.text = "Your Willpower has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").player["Willpower"]);
	elif(stat == "Agility"):
			messageText.text = "Your Agility has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").player["Agility"]);

func _on_ReturnButton_pressed():
	get_node("/root/BattleSceneManager").go_home();

func _on_CancelPayButton_pressed():
	get_node("/root/BattleSceneManager").go_home();

func _on_PayButton_pressed():
	var playerStats = get_node("/root/PlayerStats");
	if(playerStats.has_gold(get_node("/root/Global").trainingCost)):
		if(get_node("/root/Network").get_training(playerStats.player, get_node("/root/Global").trainingStat)):
			get_node("PlayerHUD").update_player_hud();
			get_node("PlayerHUD/Avatar/StatWindow").update();
			get_node("Scene/Background/GetStat").visible = true;
			get_node("Scene/Background/Pay?").visible = false;
		else:
			#Failed to save character
			print("Failed to save character");
			get_node("/root/BattleSceneManager").go_home();
	else:
		get_node("Scene/Background/NotEnough").visible = true;
		get_node("Scene/Background/Pay?").visible = false;

func _on_DarnButton_pressed():
	get_node("/root/BattleSceneManager").go_home();
