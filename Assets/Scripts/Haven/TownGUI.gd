extends Node2D

func _ready():
	var playerStats = get_parent().get_node("/root/PlayerStats");
	get_parent().get_node("PlayerHUD").update_player_hud();


func _on_RandomBattleButton_pressed():
	get_node("../Screen").show_message("Loading...");
	get_node("/root/BattleSceneManager").do_random_battle();

func _on_TrainerButton_pressed():
	get_node("../Screen").show_message("Loading...");
	get_tree().change_scene("res://Assets/Scenes/Training/Training.tscn");

func _on_DevButton_pressed():
	get_node("Dev/InputIDBackground").visible = true;

func _on_OkayButton_pressed():
	var id = get_node("Dev/InputIDBackground/InputID/Input").text;
	if get_node("/root/BattleManager").has_battle_with_id(id):
		var battle = get_node("/root/BattleManager").get_battle_with_id(id);
		get_node("/root/BattleSceneManager").do_battle(battle, "res://Assets/Scenes/haven.tscn");


func _on_RestButton_pressed():
	get_node("/root/PlayerStats").recover_all();
	get_parent().get_node("PlayerHUD").update_player_hud();


func _on_RefillPotButton_pressed():
	get_node("/root/Inventory").refill_potions();


func _on_BlacksmithButon_pressed():
	var network = get_node("/root/Network");
	get_node("../Screen").show_message("Loading...");
	network.get_haven_blacksmith_inventory();
	yield(network, "got_response");
	var shopInventory = network.shopInventory;
	get_parent().get_node("Blacksmith").shopWeaponInventory = shopInventory["Weapons"];
	get_parent().get_node("Blacksmith").shopArmorInventory = shopInventory["Armors"];
	get_parent().get_node("Blacksmith").shopShieldInventory = shopInventory["Shields"];
	get_parent().get_node("Blacksmith").visible = true;
	visible = false;
	get_node("../Screen").hide_message();