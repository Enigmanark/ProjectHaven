extends Node2D

var open = false;
var selected = {};
var selectedWeapon;
var selectedShield
var selectedArmor;
var canEquip = false;
var inBattle = false;
var weaponsSelected = false;
var armorSelected = false;
var shieldSelected = false;

func _ready():
	selectedWeapon = get_node("/root/Inventory").get_weapon_slot(0);

func _on_CloseButton_pressed():
	get_parent().get_node("TownGUI").visible = true;
	get_node("PopupEquipmentContainer/PopupInventory").visible = false;
	visible = false;


func _on_WeaponButton_pressed():
	weaponsSelected = true;
	armorSelected = false;
	shieldSelected = false;
	var inventory = get_node("/root/Inventory");
	var weaponSlot1 = inventory.get_weapon_slot(0);
	var weaponSlot2 = inventory.get_weapon_slot(1);
	var weaponSlot3 = inventory.get_weapon_slot(2);
	var weaponSlot4 = inventory.get_weapon_slot(3);
	var weaponSlot5 = inventory.get_weapon_slot(4);
	var weaponSlot6 = inventory.get_weapon_slot(5);
	var weaponSlot7 = inventory.get_weapon_slot(6);
	var weaponSlot8 = inventory.get_weapon_slot(7);
	var weaponSlot9 = inventory.get_weapon_slot(8);
	var weaponSlot10 = inventory.get_weapon_slot(9);
	if(weaponSlot1 != null):
		var name = weaponSlot1["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot1/Slot1Background/Slot1Name").text = name;
	if(weaponSlot2 != null):
		var name = weaponSlot2["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot2/Slot2Background/Slot2Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot2/Slot2Background/Slot2Name").text = "None";
	if(weaponSlot3 != null):
		var name = weaponSlot3["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot3/Slot3Background/Slot3Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot3/Slot3Background/Slot3Name").text = "None";
	if(weaponSlot4 != null):
		var name = weaponSlot4["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot4/Slot4Background/Slot4Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot4/Slot4Background/Slot4Name").text = "None";
	if(weaponSlot5 != null):
		var name = weaponSlot5["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot5/Slot5Background/Slot5Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot5/Slot5Background/Slot5Name").text = "None";
	if(weaponSlot6 != null):
		var name = weaponSlot6["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot6/Slot6Background/Slot6Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot6/Slot6Background/Slot6Name").text = "None";
	if(weaponSlot7 != null):
		var name = weaponSlot7["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot7/Slot7Background/Slot7Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot7/Slot7Background/Slot7Name").text = "None";
	if(weaponSlot8 != null):
		var name = weaponSlot8["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot8/Slot8Background/Slot8Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot8/Slot8Background/Slot8Name").text = "None";
	if(weaponSlot9 != null):
		var name = weaponSlot9["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot9/Slot9Background/Slot9Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot9/Slot9Background/Slot9Name").text = "None";
	if(weaponSlot10 != null):
		var name = weaponSlot10["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot10/Slot10Background/Slot10Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot10/Slot10Background/Slot10Name").text = "None";
	get_node("PopupEquipmentContainer/PopupInventory").visible = true;


func _on_ArmorButton_pressed():
	armorSelected = true;
	weaponsSelected = false;
	shieldSelected = false;
	var inventory = get_node("/root/Inventory");
	var armorSlot1 = inventory.get_armor_slot(0);
	var armorSlot2 = inventory.get_armor_slot(1);
	var armorSlot3 = inventory.get_armor_slot(2);
	var armorSlot4 = inventory.get_armor_slot(3);
	var armorSlot5 = inventory.get_armor_slot(4);
	var armorSlot6 = inventory.get_armor_slot(5);
	var armorSlot7 = inventory.get_armor_slot(6);
	var armorSlot8 = inventory.get_armor_slot(7);
	var armorSlot9 = inventory.get_armor_slot(8);
	var armorSlot10 = inventory.get_armor_slot(9);
	if(armorSlot1 != null):
		var name = armorSlot1["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot1/Slot1Background/Slot1Name").text = name;
	if(armorSlot2 != null):
		var name = armorSlot2["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot2/Slot2Background/Slot2Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot2/Slot2Background/Slot2Name").text = "None";
	if(armorSlot3 != null):
		var name = armorSlot3["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot3/Slot3Background/Slot3Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot3/Slot3Background/Slot3Name").text = "None";
	if(armorSlot4 != null):
		var name = armorSlot4["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot4/Slot4Background/Slot4Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot4/Slot4Background/Slot4Name").text = "None";
	if(armorSlot5 != null):
		var name = armorSlot5["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot5/Slot5Background/Slot5Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot5/Slot5Background/Slot5Name").text = "None";
	if(armorSlot6 != null):
		var name = armorSlot6["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot6/Slot6Background/Slot6Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot6/Slot6Background/Slot6Name").text = "None";
	if(armorSlot7 != null):
		var name = armorSlot7["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot7/Slot7Background/Slot7Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot7/Slot7Background/Slot7Name").text = "None";
	if(armorSlot8 != null):
		var name = armorSlot8["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot8/Slot8Background/Slot8Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot8/Slot8Background/Slot8Name").text = "None";
	if(armorSlot9 != null):
		var name = armorSlot9["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot9/Slot9Background/Slot9Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot9/Slot9Background/Slot9Name").text = "None";
	if(armorSlot10 != null):
		var name = armorSlot10["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot10/Slot10Background/Slot10Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot10/Slot10Background/Slot10Name").text = "None";
	get_node("PopupEquipmentContainer/PopupInventory").visible = true;

func _on_ShieldButton_pressed():
	armorSelected = false;
	weaponsSelected = false;
	shieldSelected = true;
	var inventory = get_node("/root/Inventory");
	var shieldSlot1 = inventory.get_shield_slot(0);
	var shieldSlot2 = inventory.get_shield_slot(1);
	var shieldSlot3 = inventory.get_shield_slot(2);
	var shieldSlot4 = inventory.get_shield_slot(3);
	var shieldSlot5 = inventory.get_shield_slot(4);
	var shieldSlot6 = inventory.get_shield_slot(5);
	var shieldSlot7 = inventory.get_shield_slot(6);
	var shieldSlot8 = inventory.get_shield_slot(7);
	var shieldSlot9 = inventory.get_shield_slot(8);
	var shieldSlot10 = inventory.get_shield_slot(9);
	if(shieldSlot1 != null):
		var name = shieldSlot1["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot1/Slot1Background/Slot1Name").text = name;
	if(shieldSlot2 != null):
		var name = shieldSlot2["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot2/Slot2Background/Slot2Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot2/Slot2Background/Slot2Name").text = "None";
	if(shieldSlot3 != null):
		var name = shieldSlot3["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot3/Slot3Background/Slot3Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot3/Slot3Background/Slot3Name").text = "None";
	if(shieldSlot4 != null):
		var name = shieldSlot4["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot4/Slot4Background/Slot4Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot4/Slot4Background/Slot4Name").text = "None";
	if(shieldSlot5 != null):
		var name = shieldSlot5["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot5/Slot5Background/Slot5Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot5/Slot5Background/Slot5Name").text = "None";
	if(shieldSlot6 != null):
		var name = shieldSlot6["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot6/Slot6Background/Slot6Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot6/Slot6Background/Slot6Name").text = "None";
	if(shieldSlot7 != null):
		var name = shieldSlot7["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot7/Slot7Background/Slot7Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot7/Slot7Background/Slot7Name").text = "None";
	if(shieldSlot8 != null):
		var name = shieldSlot8["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot8/Slot8Background/Slot8Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot8/Slot8Background/Slot8Name").text = "None";
	if(shieldSlot9 != null):
		var name = shieldSlot9["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot9/Slot9Background/Slot9Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot9/Slot9Background/Slot9Name").text = "None";
	if(shieldSlot10 != null):
		var name = shieldSlot10["Name"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot10/Slot10Background/Slot10Name").text = name;
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot10/Slot10Background/Slot10Name").text = "None";
	get_node("PopupEquipmentContainer/PopupInventory").visible = true;



func _on_EquipmentButton_pressed():
	inBattle = false;
	if(!open):
		get_parent().get_node("TownGUI").visible = false;
		visible = true;
	else:
		get_parent().get_node("TownGUI").visible = true;
		visible = false;


func _on_Slot1Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot1;
	if(weaponsSelected):
		slot1 = inventory.get_weapon_slot(0)
	elif(armorSelected):
		slot1 = inventory.get_armor_slot(0);
	elif(shieldSelected):
		slot1 = inventory.get_shield_slot(0);
	if(slot1 != null):
		display_description_window(slot1);

func _on_Slot2Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot2;
	if(weaponsSelected):
		slot2 = inventory.get_weapon_slot(1)
	elif(armorSelected):
		slot2 = inventory.get_armor_slot(1);
	elif(shieldSelected):
		slot2 = inventory.get_shield_slot(1);
	if(slot2 != null):
		display_description_window(slot2);

func _on_Slot3Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot3;
	if(weaponsSelected):
		slot3 = inventory.get_weapon_slot(2)
	elif(armorSelected):
		slot3 = inventory.get_armor_slot(2);
	elif(shieldSelected):
		slot3 = inventory.get_shield_slot(2);
	if(slot3 != null):
		display_description_window(slot3);

func _on_Slot4Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot4;
	if(weaponsSelected):
		slot4 = inventory.get_weapon_slot(3)
	elif(armorSelected):
		slot4 = inventory.get_armor_slot(3);
	elif(shieldSelected):
		slot4 = inventory.get_shield_slot(3);
	if(slot4 != null):
		display_description_window(slot4);

func _on_Slot5Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot5;
	if(weaponsSelected):
		slot5 = inventory.get_weapon_slot(4)
	elif(armorSelected):
		slot5 = inventory.get_armor_slot(4);
	elif(shieldSelected):
		slot5 = inventory.get_shield_slot(4);
	if(slot5 != null):
		display_description_window(slot5);

func _on_Slot6Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot6;
	if(weaponsSelected):
		slot6 = inventory.get_weapon_slot(5)
	elif(armorSelected):
		slot6 = inventory.get_armor_slot(5);
	elif(shieldSelected):
		slot6 = inventory.get_shield_slot(5);
	if(slot6 != null):
		display_description_window(slot6);

func _on_Slot7Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot7;
	if(weaponsSelected):
		slot7 = inventory.get_weapon_slot(6)
	elif(armorSelected):
		slot7 = inventory.get_armor_slot(6);
	elif(shieldSelected):
		slot7 = inventory.get_shield_slot(6);
	if(slot7 != null):
		display_description_window(slot7);

func _on_Slot8Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot8;
	if(weaponsSelected):
		slot8 = inventory.get_weapon_slot(7)
	elif(armorSelected):
		slot8 = inventory.get_armor_slot(7);
	elif(shieldSelected):
		slot8 = inventory.get_shield_slot(7);
	if(slot8 != null):
		display_description_window(slot8);

func _on_Slot9Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot9;
	if(weaponsSelected):
		slot9 = inventory.get_weapon_slot(8);
	elif(armorSelected):
		slot9 = inventory.get_armor_slot(8);
	elif(shieldSelected):
		slot9 = inventory.get_shield_slot(8);
	if(slot9 != null):
		display_description_window(slot9);

func _on_Slot10Button_pressed():
	var inventory = get_node("/root/Inventory");
	var slot10;
	if(weaponsSelected):
		slot10 = inventory.get_weapon_slot(9);
	elif(armorSelected):
		slot10 = inventory.get_armor_slot(9);
	elif(shieldSelected):
		slot10 = inventory.get_shield_slot(9);
	if(slot10 != null):
		display_description_window(slot10);

func display_description_window(slot):
	if(weaponsSelected):
		selected["Type"] = "Weapon";
		selected["Equip"] = slot;
	elif(armorSelected):
		selected["Type"] = "Armor";
		selected["Equip"] = slot;
	elif(shieldSelected):
		selected["Type"] = "Shield";
		selected["Equip"] = slot;
	is_already_equipped(selected);
	get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
	if(selected["Type"] == "Weapon"):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = selected["Equip"]["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = selected["Equip"]["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(selected["Equip"]["MinDamage"]) + " - " + str(selected["Equip"]["MaxDamage"]) + " " + str(selected["Equip"]["Element"]);
		#Bonus accuracy
		if(selected["Equip"]["BonusAccuracy"] != null):
			if(selected["Equip"]["BonusAccuracy"] > 0):
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").text = "+" + str(selected["Equip"]["BonusAccuracy"]) + " Accuracy";
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").visible = true;
			else:
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").visible = false;
		else:
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").visible = false;
		#Bonus crit
		if(selected["Equip"]["BonusCritRate"] != null):
			if(selected["Equip"]["BonusCritRate"] > 0):
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").visible = true;
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").text = "+" + str(selected["Equip"]["BonusCritRate"]) + " Crit Rate";
			else:
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").visible = false;
		else:
			get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").visible = false;
	#Armor
	elif(selected["Type"] == "Armor"):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").visible = false;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").visible = false;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = selected["Equip"]["Description"];
		if(selected["Equip"]["BonusAccuracy"] != null):
			if(selected["Equip"]["BonusAccuracy"] > 0):
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").text = "+" + str(selected["Equip"]["BonusAccuracy"]) + " Accuracy";
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").visible = true;
			else:
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").visible = false;
		else:
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").visible = false;
		if(selected["Equip"]["BonusCrit"] != null):
			if(selected["Equip"]["BonusCrit"] > 0):
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").visible = true;
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").text = "+" + str(selected["Equip"]["BonusCrit"]) + " Crit Rate";
			else:
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").visible = false;
		else:
			get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").visible = false;
	elif(selected["Type"] == "Shield"):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").visible = false;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").visible = false;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = selected["Equip"]["Description"];
		if(selected["Equip"]["BonusAccuracy"] != null):
			if(selected["Equip"]["BonusAccuracy"] > 0):
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").text = "+" + str(selected["Equip"]["BonusAccuracy"]) + " Accuracy";
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").visible = true;
			else:
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").visible = false;
		else:
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusAccText").visible = false;
		if(selected["Equip"]["BonusCrit"] != null):
			if(selected["Equip"]["BonusCrit"] > 0):
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").visible = true;
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").text = "+" + str(selected["Equip"]["BonusCrit"]) + " Crit Rate";
			else:
				get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").visible = false;
		else:
			get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/BonusCritText").visible = false;	

func is_already_equipped(select):
	if(select["Type"] == "Weapon"):
		var playerWeaponID = get_node("/root/PlayerStats").get_weapon()["ID"];
		if(select["Equip"]["ID"] == playerWeaponID):
			canEquip = false;
		else:
			canEquip = true;
	elif(select["Type"] == "Armor"):
		var playerArmorID = get_node("/root/PlayerStats").get_armor()["ID"];
		if(select["Equip"]["ID"] == playerArmorID):
			canEquip = false;
		else:
			canEquip = true;
	elif(select["Type"] == "Shield"):
		var playerShieldID = get_node("/root/PlayerStats").get_shield()["ID"];
		if(select["Equip"]["ID"] == playerShieldID):
			canEquip = false;
		else:
			canEquip = true;
	if(!canEquip):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/EquipButton/EquipText").text = "Equipped";
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/EquipButton/EquipText").text = "Equip";	

func _on_EquipButton_pressed():
	var didEquip = false;
	if(canEquip):
		if(selected["Type"] == "Weapon"):
			if(get_node("/root/PlayerStats").equip_weapon(selected)):
				didEquip = true;
		elif(selected["Type"] == "Shield"):
			if(get_node("/root/PlayerStats").equip_shield(selected)):
				didEquip = true;
		elif(selected["Type"] == "Armor"):
			if(get_node("/root/PlayerStats").equip_armor(selected)):
				didEquip = true;
		
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/EquipButton/EquipText").text = "Equipped";
		if(inBattle):
			if(!didEquip):
				get_node("../Screen").show_ok_message("Your level is not high enough");
			get_node("../Battle").load_player();
		else:
			if(!didEquip):
				get_node("../Screen").show_ok_message("Your level is not high enough");
		
func _on_BattleWeaponButton_pressed():
	get_node("../BattleMenu/TopMenu/BattleCloseButton").visible = true;
	inBattle = true;
	_on_WeaponButton_pressed();

func _on_BattleCloseButton_pressed():
	get_node("PopupEquipmentContainer/PopupInventory").visible = false;
	get_node("../BattleMenu/TopMenu/BattleCloseButton").visible = false;


func _on_BattleArmorButton_pressed():
	get_node("../BattleMenu/TopMenu/BattleCloseButton").visible = true;
	inBattle = true;
	_on_ArmorButton_pressed();


func _on_BattleShieldButton_pressed():
	get_node("../BattleMenu/TopMenu/BattleCloseButton").visible = true;
	inBattle = true;
	_on_ShieldButton_pressed();
