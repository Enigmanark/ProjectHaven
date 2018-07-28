extends Node2D

var weaponInventory;
var armorInventory;
var shieldInventory;

func _ready():
	pass;

func _on_BSCloseButton_pressed():
	get_node(".").visible = false;
	get_node("../TownGUI").visible = true;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = false;
	get_node("BlacksmithBackground/BSGreetText").visible = true;

func _on_BSBuyButton_pressed():
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = true;
	get_node("BlacksmithBackground/BSGreetText").visible = false;
	populate_slots();

func _on_BSSellButton_pressed():
	pass # replace with function body

func _on_BSArmorButton_pressed():
	get_node("BlacksmithBackground/BSGreetText").visible = false;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = true;
	populate_slots("Armor");

func _on_BSWeaponButton_pressed():
	get_node("BlacksmithBackground/BSGreetText").visible = false;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = true;
	populate_slots("Weapon");


func _on_BSShieldButton_pressed():
	get_node("BlacksmithBackground/BSGreetText").visible = false;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = true;
	populate_slots("Shield");
	
func populate_slots(type):
	var inventory;
	if(type == "Weapon"):
		inventory = weaponInventory;
	elif(type == "Armor"):
		inventory = armorInventory;
	elif(type == "Shield"):
		inventory = shieldInventory;
		
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

