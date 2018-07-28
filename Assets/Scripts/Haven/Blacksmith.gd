extends Node2D

var shopWeaponInventory;
var shopArmorInventory;
var shopShieldInventory;
var playerWeaponInventory;
var playerArmorInventory;
var playerShieldInventory;
var buying = true;
var type;
var selected = false;

func _ready():
	pass;

func loadPlayerInventory():
	var inventory = get_node("/root/Inventory");
	playerWeaponInventory = inventory.weapons;
	playerArmorInventory = inventory.armors;
	playerShieldInventory = inventory.shields;

func _on_BSCloseButton_pressed():
	get_node(".").visible = false;
	get_node("../TownGUI").visible = true;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = false;
	get_node("BlacksmithBackground/BuySellWindow/BSDescription").visible = false;
	get_node("BlacksmithBackground/BSGreetText").visible = true;
	get_node("BlacksmithBackground/BSArmorButton").visible = false;
	get_node("BlacksmithBackground/BSWeaponButton").visible = false;
	get_node("BlacksmithBackground/BSShieldButton").visible = false;

func _on_BSBuyButton_pressed():
	buying = true;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = false;
	get_node("BlacksmithBackground/BuySellWindow/BSDescription").visible = false;
	get_node("BlacksmithBackground/BSArmorButton").visible = true;
	get_node("BlacksmithBackground/BSWeaponButton").visible = true;
	get_node("BlacksmithBackground/BSShieldButton").visible = true;

func _on_BSSellButton_pressed():
	buying = false;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = false;
	get_node("BlacksmithBackground/BuySellWindow/BSDescription").visible = false;
	get_node("BlacksmithBackground/BSGreetText").visible = false;
	get_node("BlacksmithBackground/BSArmorButton").visible = true;
	get_node("BlacksmithBackground/BSWeaponButton").visible = true;
	get_node("BlacksmithBackground/BSShieldButton").visible = true;
	loadPlayerInventory();

func _on_BSArmorButton_pressed():
	get_node("BlacksmithBackground/BSGreetText").visible = false;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = true;
	get_node("BlacksmithBackground/BSGreetText").visible = false;
	type = "Armor";
	populate_slots();

func _on_BSWeaponButton_pressed():
	get_node("BlacksmithBackground/BSGreetText").visible = false;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = true;
	type = "Weapon";
	populate_slots();


func _on_BSShieldButton_pressed():
	get_node("BlacksmithBackground/BSGreetText").visible = false;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = true;
	type = "Shield";
	populate_slots();
	
	
func populate_slots():
	var inventory;
	if(buying):
		if(type == "Weapon"):
			inventory = shopWeaponInventory;
		elif(type == "Armor"):
			inventory = shopArmorInventory;
		elif(type == "Shield"):
			inventory = shopShieldInventory;
	else:
		if(type == "Weapon"):
			inventory = playerWeaponInventory;
		elif(type == "Armor"):
			inventory = playerArmorInventory;
		elif(type == "Shield"):
			inventory = playerShieldInventory;
		
	var slot1Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot1/Slot1Text");
	if(inventory[0] != null):
		slot1Text.text = inventory[0]["Name"];
	else:
		slot1Text.text = "None";
	var slot2Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot2/Slot2Text");
	if(inventory[1] != null):
		slot2Text.text = inventory[1]["Name"];
	else:
		slot2Text.text = "None";
	var slot3Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot3/Slot3Text");
	if(inventory[2] != null):
		slot3Text.text = inventory[2]["Name"];
	else:
		slot3Text.text = "None";
	var slot4Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot4/Slot4Text");
	if(inventory[3] != null):
		slot4Text.text = inventory[3]["Name"];
	else:
		slot4Text.text = "None";
	var slot5Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot5/Slot5Text");
	if(inventory[4] != null):
		slot5Text.text = inventory[4]["Name"];
	else:
		slot5Text.text = "None";
	var slot6Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot6/Slot6Text");
	if(inventory[5] != null):
		slot6Text.text = inventory[5]["Name"];
	else:
		slot6Text.text = "None";
	var slot7Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot7/Slot7Text");
	if(inventory[6] != null):
		slot7Text.text = inventory[6]["Name"];
	else:
		slot7Text.text = "None";
	var slot8Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot8/Slot8Text");
	if(inventory[7] != null):
		slot8Text.text = inventory[7]["Name"];
	else:
		slot8Text.text = "None";
	var slot9Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot9/Slot9Text");
	if(inventory[8] != null):
		slot9Text.text = inventory[8]["Name"];
	else:
		slot9Text.text = "None";
	var slot10Text = get_node("BlacksmithBackground/BuySellWindow/BSSlots/BuySellBackground/BSSlots/Slot10/Slot10Text");
	if(inventory[9] != null):
		slot10Text.text = inventory[9]["Name"];
	else:
		slot10Text.text = "None";

func show_description(item):
	var button = get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSBuyButton2/BSBuyText2");
	if(buying):
		button.text = "Buy";
	else:
		button.text = "Sell";
		
	var desc = get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSDescriptionText");
	desc.text = item["Description"];
	
	var level = get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSLevelText");
	level.text = "Level: " + str(item["Level"]);
	
	var cost = get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSCostText");
	cost.text = "Cost: " + str(item["Gold"]) + " Gold";
	
	var accuracy = get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSAccuracyText");
	if(item["BonusAccuracy"] > 0):
		accuracy.visible = true;
		accuracy.text = "+" + str(item["BonusAccuracy"]) + " Accuracy";
	else:
			accuracy.visible = false;
	
	if(type == "Armor" or type == "Shield"):
		var crit = get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSCritText");
		if(item["BonusCrit"] > 0):
			crit.visible = true;
			crit.text = "+" + str(item["BonusCrit"]) + " Critical Rate";
		else:
			crit.visible = false;
	if(type == "Weapon"):
		get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSTypeText").visible = true;
		get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSDamageText").visible = true;
		var weaponType = get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSTypeText");
		weaponType.text = item["Type"];
		
		var damage = get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSDamageText");
		damage.text = str(item["MinDamage"]) + "-" + str(item["MaxDamage"]) + " " + item["Element"];
	else:
		get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSTypeText").visible = false;
		get_node("BlacksmithBackground/BuySellWindow/BSDescription/BSDescriptionBG1/BSDescriptionBG2/BSDamageText").visible = false;

func selectItem(index):
	get_node("BlacksmithBackground/BuySellWindow/BSDescription").visible = true;
	var inventory;
	if(buying):
		if(type == "Weapon"):
			inventory = shopWeaponInventory;
		elif(type == "Armor"):
			inventory = shopArmorInventory;
		elif(type == "Shield"):
			inventory = shopShieldInventory;
	else:
		if(type == "Weapon"):
			inventory = playerWeaponInventory;
		elif(type == "Armor"):
			inventory = playerArmorInventory;
		elif(type == "Shield"):
			inventory = playerShieldInventory;
	var item = inventory[index];
	selected = item;
	show_description(item);

func _on_Slot1Button_pressed():
	selectItem(0);


func _on_Slot2Button_pressed():
	selectItem(1);


func _on_Slot3Button_pressed():
	selectItem(2);


func _on_Slot4Button_pressed():
	selectItem(3);


func _on_Slot5Button_pressed():
	selectItem(4);


func _on_Slot6Button_pressed():
	selectItem(5);


func _on_Slot7Button_pressed():
	selectItem(6);


func _on_Slot8Button_pressed():
	selectItem(7);


func _on_Slot9Button_pressed():
	selectItem(8);


func _on_Slot10Button_pressed():
	selectItem(9);


func _on_BSBuyButton2_pressed():
	get_node("../Screen").show_message("Retrieving...");
	var network = get_node("/root/Network");
	if(buying):
		network.buy_item(type, selected["ID"]);
		yield(network, "character_loaded");
		if(network.transactionSuccessful):
			get_node("../Screen").show_ok_message("Item Bought");
		else:
			get_node("../Screen").show_ok_message("Buy Failed");
	else:
		print("Type is " + type);
		print("ID is " + str(selected["ID"]));
		print("Name is " + selected["Name"]);
		network.sell_item(type, selected["ID"]);
		yield(network, "character_loaded");
		if(network.transactionSuccessful):
			get_node("../Screen").show_ok_message("Item Sold");
			populate_slots();
		else:
			get_node("../Screen").show_ok_message("Sell failed");
			

	
	
