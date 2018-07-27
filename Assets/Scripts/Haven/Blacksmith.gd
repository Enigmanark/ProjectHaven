extends Node2D

func _ready():
	pass

func _on_BSCloseButton_pressed():
	get_node(".").visible = false;
	get_node("../TownGUI").visible = true;
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = false;
	get_node("BlacksmithBackground/BSGreetText").visible = true;

func _on_BSBuyButton_pressed():
	get_node("BlacksmithBackground/BuySellWindow/BSSlots").visible = true;
	get_node("BlacksmithBackground/BSGreetText").visible = false;


func _on_BSSellButton_pressed():
	pass # replace with function body
