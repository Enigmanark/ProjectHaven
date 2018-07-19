extends Node2D

func _ready():
	var playerStats = get_parent().get_node("/root/PlayerStats");
	get_parent().get_node("GUI/PlayerHUD").update_player_hud();


func _on_RandomBattleButton_pressed():
	get_parent().get_node("/root/BattleSceneManager").do_random_battle();

func _on_TrainerButton_pressed():
	get_tree().change_scene("res://Assets/Scenes/Training/Training.tscn");

func _on_DevButton_pressed():
	get_node("Dev/InputIDBackground").visible = true;

func _on_OkayButton_pressed():
	var id = get_node("Dev/InputIDBackground/InputID/Input").text;
	if get_node("/root/BattleManager").has_battle_with_id(id):
		var battle = get_node("/root/BattleManager").get_battle_with_id(id);
		get_node("/root/BattleSceneManager").do_battle(battle, "res://Assets/Scenes/haven.tscn");
