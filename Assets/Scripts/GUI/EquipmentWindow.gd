extends Node2D

var open = false;

func _ready():
	pass

func _on_CloseButton_pressed():
	get_parent().get_node("TownGUI").visible = true;
	visible = false;


func _on_WeaponButton_pressed():
	pass # replace with function body


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
