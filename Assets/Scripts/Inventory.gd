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
	
	armors.append(null);
	armors.append(null);
	armors.append(null);
	armors.append(null);
	armors.append(null);
	armors.append(null);
	armors.append(null);
	armors.append(null);
	armors.append(null);
	armors.append(null);
	
	shields.append(null);
	shields.append(null);
	shields.append(null);
	shields.append(null);
	shields.append(null);
	shields.append(null);
	shields.append(null);
	shields.append(null);
	shields.append(null);
	shields.append(null);

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
	
func get_armor_slot(slot):
	return armors[slot];
	
func get_shield_slot(slot):
	return shields[slot];
	
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
	
	var shs = inv["Shields"];
	shields[0] = shs[0];
	shields[1] = shs[1];
	shields[2] = shs[2];
	shields[3] = shs[3];
	shields[4] = shs[4];
	shields[5] = shs[5];
	shields[6] = shs[6];
	shields[7] = shs[7];
	shields[8] = shs[8];
	shields[9] = shs[9];
	
	var arms = inv["Armors"];
	armors[0] = arms[0];
	armors[1] = arms[1];
	armors[2] = arms[2];
	armors[3] = arms[3];
	armors[4] = arms[4];
	armors[5] = arms[5];
	armors[6] = arms[6];
	armors[7] = arms[7];
	armors[8] = arms[8];
	armors[9] = arms[9];
	
func get_weapon_by_id(id):
	for weapon in weapons:
		if(weapon != null):
			if(weapon["ID"] == id):
				return weapon;
	return null;

func get_armor_by_id(id):
	for armor in armors:
		if(armor != null):
			if(armor["ID"] == id):
				return armor;
	return null;
	
func get_shield_by_id(id):
	for shield in shields:
		if(shield != null):
			if(shield["ID"] == id):
				return shield;
	return null;