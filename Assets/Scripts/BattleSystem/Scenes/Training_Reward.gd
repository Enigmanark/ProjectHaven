extends Node2D

func _ready():
	increase_stat();

func increase_stat():
	var stat = get_node("/root/Global").trainingStat;
	var playerStats = get_node("/root/PlayerStats");
	var messageText = get_node("Scene/Background/Pay?/Message");
	var statText = get_node("Scene/Background/Pay?/Message/Increase");
	if(stat == "Strength"):
			playerStats.add_strength(5);
			messageText.text = "Your Strength has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").strength);
	elif(stat == "Dexterity"):
			playerStats.add_dexterity(5);
			messageText.text = "Your Dexterity has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").dexterity);		
	elif(stat == "Endurance"):
			playerStats.add_endurance(5);
			messageText.text = "Your Endurance has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").endurance);
	elif(stat == "Intelligence"):
			playerStats.add_intelligence(5);
			messageText.text = "Your Intelligence has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").intelligence);
	elif(stat == "Willpower"):
			playerStats.add_willpower(5);
			messageText.text = "Your Willpower has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").willpower);
	elif(stat == "Cunning"):
			playerStats.add_cunning(5);
			messageText.text = "Your Cunning has been increased to:";
			statText.text = str(get_node("/root/PlayerStats").cunning);

func _on_ReturnButton_pressed():
	get_node("/root/BattleSceneManager").go_home();
