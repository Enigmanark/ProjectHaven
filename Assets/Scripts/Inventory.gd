extends Node

var weapons = [];
var armors = [];
var shields = [];
var items = [];

func _ready():
	weapons.append(null);
	weapons.append(null);
	weapons.append(null);
	weapons.append(null);
	weapons.append(null);
	weapons.append(null);
	weapons.append(null);
	weapons.append(null);
	weapons.append(null);
	weapons.append(null);
	
func get_weapon_slot(slot):
	return weapons[slot];
	
func add_weapon(weapon):
	for i in range(0, weapons.size()):
		if(weapons[i] == null):
			print("added weapon " + weapon["Name"]);
			weapons[i] = weapon;
			return;
	
func has_space_for_weapon():
	for slot in weapons:
		if slot == null:
			return true;
	return false;
