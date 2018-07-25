extends Node2D

var open = false;
var healthPotRestore = 500;
var staminaPotRestore = 100;
var manaPotRestore = 1000;
var inBattle = false;
var healthPotAmount;
var manaPotAmount;
var staminaPotAmount;

func _ready():
	load_potions();

func _on_BattlePotionButton_pressed():
	inBattle = true;
	if !open:
		visible = true;
		open = true;
	else:
		visible = false;
		open = false;

func load_potions():
	var inventory = get_node("/root/Inventory");
	healthPotAmount = inventory.get_health_potion_amount();
	manaPotAmount = inventory.get_mana_potion_amount();
	staminaPotAmount = inventory.get_stamina_potion_amount();
	get_node("HealthPotionBackground/HealthPotionText").text = "x" + str(healthPotAmount) + " Health Potion";
	get_node("StaminaPotionBackground/StaminaPotionText").text = "x" + str(staminaPotAmount) + " Stamina Potion";
	get_node("ManaPotionBackground/ManaPotionText").text = "x" + str(manaPotAmount) + " Mana Potion";

func _on_PotionClose_pressed():
	visible = false;
	open = false;
	if(!inBattle):
		get_node("../../../TownGUI").visible = true;

func _on_HealthPotButton_pressed():
	if(healthPotAmount > 0):
		var inventory = get_node("/root/Inventory");
		get_node("/root/PlayerStats").restore_health(healthPotRestore);
		inventory.remove_health_potion();
		load_potions();
		if(inBattle):
			get_node("../../../../Battle").battlePhase = true;
			get_node("../../../../HUD/PlayerHUD").update_player_hud();
		else:
			get_node("../../../PlayerHUD").update_player_hud();
			
func _on_StaminaPotButton_pressed():
	if(staminaPotAmount > 0):
		var inventory = get_node("/root/Inventory");
		get_node("/root/PlayerStats").restore_stamina(staminaPotRestore);
		inventory.remove_stamina_potion();
		load_potions();
		if(inBattle):
			get_node("../../../../../Battle").battlePhase = true;
			get_node("../../../../HUD/PlayerHUD").update_player_hud();
		else:
			get_node("../../../PlayerHUD").update_player_hud();

func _on_ManaPotButton_pressed():
	if(manaPotAmount > 0):
		var inventory = get_node("/root/Inventory");
		get_node("/root/PlayerStats").restore_mana(manaPotRestore);
		inventory.remove_mana_potion();
		load_potions();
		if(inBattle):
			get_node("../../../../../Battle").battlePhase = true;
			get_node("../../../../HUD/PlayerHUD").update_player_hud();
		else:
			get_node("../../../PlayerHUD").update_player_hud();


func _on_PotionButton_pressed():
	if !open:
		visible = true;
		open = true;
		load_potions();
		get_node("../../../TownGUI").visible = false;
	else:
		visible = false;
		open = false;
		get_node("../../../TownGUI").visible = true;
