extends Node2D

var open = false;

func _ready():
	pass

func _on_CloseButton_pressed():
	get_parent().get_node("TownGUI").visible = true;
	get_node("PopupEquipmentContainer/PopupInventory").visible = false;
	visible = false;


func _on_WeaponButton_pressed():
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
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot1/Slot1Background/Slot1Name").text = weaponSlot1["Name"];
	if(weaponSlot2 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot2/Slot2Background/Slot2Name").text = weaponSlot2["Name"];
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot2/Slot2Background/Slot2Name").text = "None";
	if(weaponSlot3 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot3/Slot3Background/Slot3Name").text = weaponSlot3["Name"];
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot3/Slot3Background/Slot3Name").text = "None";
	if(weaponSlot4 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot4/Slot4Background/Slot4Name").text = weaponSlot4["Name"];
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot4/Slot4Background/Slot4Name").text = "None";
	if(weaponSlot5 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot5/Slot5Background/Slot5Name").text = weaponSlot5["Name"];
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot5/Slot5Background/Slot5Name").text = "None";
	if(weaponSlot6 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot6/Slot6Background/Slot6Name").text = weaponSlot6["Name"];
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot6/Slot6Background/Slot6Name").text = "None";
	if(weaponSlot7 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot7/Slot7Background/Slot7Name").text = weaponSlot7["Name"];
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot7/Slot7Background/Slot7Name").text = "None";
	if(weaponSlot8 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot8/Slot8Background/Slot8Name").text = weaponSlot8["Name"];
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot8/Slot8Background/Slot8Name").text = "None";
	if(weaponSlot9 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot9/Slot9Background/Slot9Name").text = weaponSlot9["Name"];
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot9/Slot9Background/Slot9Name").text = "None";
	if(weaponSlot10 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot10/Slot10Background/Slot10Name").text = weaponSlot10["Name"];
	else:
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/SlotContainer/Slot10/Slot10Background/Slot10Name").text = "None";
	get_node("PopupEquipmentContainer/PopupInventory").visible = true;


func _on_ArmorButton_pressed():
	pass # replace with function body


func _on_ShieldButton_pressed():
	pass # replace with function body


func _on_EquipmentButton_pressed():
	if(!open):
		get_parent().get_node("TownGUI").visible = false;
		visible = true;
	else:
		get_parent().get_node("TownGUI").visible = true;
		visible = false;


func _on_Slot1Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot1 = inventory.get_weapon_slot(0);
	if(weaponSlot1 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot1["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot1["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot1["MinDamage"]) + " - " + str(weaponSlot1["MaxDamage"]) + " " + str(weaponSlot1["Element"]);

func _on_Slot2Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot2 = inventory.get_weapon_slot(1);
	if(weaponSlot2 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot2["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot2["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot2["MinDamage"]) + " - " + str(weaponSlot2["MaxDamage"]) + " " + str(weaponSlot2["Element"]);


func _on_Slot3Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot3 = inventory.get_weapon_slot(2);
	if(weaponSlot3 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot3["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot3["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot3["MinDamage"]) + " - " + str(weaponSlot3["MaxDamage"]) + " " + str(weaponSlot3["Element"]);


func _on_Slot4Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot4 = inventory.get_weapon_slot(3);
	if(weaponSlot4 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot4["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot4["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot4["MinDamage"]) + " - " + str(weaponSlot4["MaxDamage"]) + " " + str(weaponSlot4["Element"]);


func _on_Slot5Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot5 = inventory.get_weapon_slot(4);
	if(weaponSlot5 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot5["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot5["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot5["MinDamage"]) + " - " + str(weaponSlot5["MaxDamage"]) + " " + str(weaponSlot5["Element"]);


func _on_Slot6Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot6 = inventory.get_weapon_slot(5);
	if(weaponSlot6 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot6["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot6["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot6["MinDamage"]) + " - " + str(weaponSlot6["MaxDamage"]) + " " + str(weaponSlot6["Element"]);


func _on_Slot7Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot7 = inventory.get_weapon_slot(6);
	if(weaponSlot7 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot7["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot7["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot7["MinDamage"]) + " - " + str(weaponSlot7["MaxDamage"]) + " " + str(weaponSlot7["Element"]);


func _on_Slot8Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot8 = inventory.get_weapon_slot(7);
	if(weaponSlot8 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot8["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot8["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot8["MinDamage"]) + " - " + str(weaponSlot8["MaxDamage"]) + " " + str(weaponSlot8["Element"]);


func _on_Slot9Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot9 = inventory.get_weapon_slot(8);
	if(weaponSlot9 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot9["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot9["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot9["MinDamage"]) + " - " + str(weaponSlot9["MaxDamage"]) + " " + str(weaponSlot9["Element"]);


func _on_Slot10Button_pressed():
	var inventory = get_node("/root/Inventory");
	var weaponSlot10 = inventory.get_weapon_slot(9);
	if(weaponSlot10 != null):
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer").visible = true;
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/ItemDescription").text = weaponSlot10["Description"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/TypeText").text = weaponSlot10["Type"];
		get_node("PopupEquipmentContainer/PopupInventory/InventoryBackground/DescriptionContainer/DescriptionContainerBackground/DescriptionBackground/DamageText").text = str(weaponSlot10["MinDamage"]) + " - " + str(weaponSlot10["MaxDamage"]) + " " + str(weaponSlot10["Element"]);
