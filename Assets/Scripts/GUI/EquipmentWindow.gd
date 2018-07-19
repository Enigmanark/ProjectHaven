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
