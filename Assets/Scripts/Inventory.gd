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
	
func get_portable_inventory():
	var weps = [];
	weps.append(weapons[0]);
	weps.append(weapons[1]);
	weps.append(weapons[2]);
	weps.append(weapons[3]);
	weps.append(weapons[4]);
	weps.append(weapons[5]);
	weps.append(weapons[6]);
	weps.append(weapons[7]);
	weps.append(weapons[8]);
	weps.append(weapons[9]);
	var inv = {
		"Weapons" : weps,
		"HealthPotions" : healthPotion,
		"ManaPotions" : manaPotion,
		"StaminaPotions" : staminaPotion
	};
	return inv;
	
func load_portable_inventory(inv):
	healthPotion = inv["HealthPotions"];
	manaPotion = inv["ManaPotions"];
	staminaPotion = inv["StaminaPotions"];
	
	var weps = inv["Weapons"];
	weapons[0] = weps[0];
	weapons[1] = weps[1];
	weapons[2] = weps[2];
	weapons[3] = weps[3];
	weapons[4] = weps[4];
	weapons[5] = weps[5];
	weapons[6] = weps[6];
	weapons[7] = weps[7];
	weapons[8] = weps[8];
	weapons[9] = weps[9];
	
func has_space_for_weapon():
	for slot in weapons:
		if slot == null:
			return true;
	return false;
