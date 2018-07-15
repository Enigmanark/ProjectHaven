extends Node2D

func _ready():
	var playerStats = get_parent().get_node("/root/PlayerStats");
	get_parent().get_node("GUI/PlayerHUD").update_player_hud(playerStats);


func _on_RandomBattleButton_pressed():
	get_parent().get_node("/root/BattleSceneManager").do_random_battle();
