extends Node

var _name;
var id;
var description;
var minDamage;
var maxDamage;
var bonusAccuracy;
var bonusCritRate;
var element;
var weapons = [];
signal WeaponsInitialized;

func _ready():
	init_items();

func get_weapon_by_id(i):
	for weapon in weapons:
		if weapon["ID"] == i:
			print("returning " + str(i));
			return weapon;
	return null;
	
func init_items():
	_name = "Iron Sword";
	id = 1;
	description = "Just a simple Iron Sword, what more do you want me to say?";
	minDamage = 5;
	maxDamage = 10;
	bonusAccuracy = 0;
	bonusCritRate = 0;
	element = "Earth";
	makeWeapon(_name, id, description, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);
	
	_name = "Aqua Sword";
	id = 2;
	description = "Just a simple Iron Sword imbued with the element of water.";
	minDamage = 4;
	maxDamage = 9;
	bonusAccuracy = 0;
	bonusCritRate = 0;
	element = "Water";
	makeWeapon(_name, id, description, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);
	
	_name = "Flame Sword";
	id = 3;
	description = "A sword forged with in intense heat.";
	minDamage = 6;
	maxDamage = 11;
	bonusAccuracy = 0;
	bonusCritRate = 0;
	element = "Fire";
	makeWeapon(_name, id, description, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);
	
	
	emit_signal("WeaponsInitialized");
	
func makeWeapon(n, i, desc, minD, maxD, bA, bCR, e):
	var weapon = {};
	weapon["Name"] = n;
	weapon["ID"] = i;
	weapon["Description"] = desc;
	weapon["MinDamage"] = minD;
	weapon["MaxDamage"] = maxD;
	weapon["BonusAccuracy"] = bA;
	weapon["BonusCritRate"] = bCR;
	weapon["Element"] = e;
	weapons.append(weapon);
