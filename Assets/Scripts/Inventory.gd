extends Node

var weapons = [];
var armors = [];
var shields = [];
var items = [];
var healthPotion = 0;
var manaPotion = 0;
var staminaPotion = 0;

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

func refill_potions():
	healthPotion = 2;
	manaPotion = 2;
	staminaPotion = 2;
	
func remove_health_potion():
	healthPotion -= 1;

func remove_mana_potion():
	manaPotion -= 1;
	
func remove_stamina_potion():
	staminaPotion -= 1;

func get_health_potion_amount():
	return healthPotion;
	
func get_mana_potion_amount():
	return manaPotion;
	
func get_stamina_potion_amount():
	return staminaPotion;
	
func get_weapon_slot(slot):
	return weapons[slot];
	
func add_weapon(weapon):
	for i in range(0, weapons.size()):
		if(weapons[i] == null):
			weapons[i] = weapon;
			return;
	
func has_space_for_weapon():
	for slot in weapons:
		if slot == null:
			return true;
	return false;
