extends Node

var _name;
var id;
var path;
var type;
var description;
var minDamage;
var maxDamage;
var bonusAccuracy;
var bonusCritRate;
var element;
var weapons = [];

func _ready():
	init_items();

func get_weapon_by_id(i):
	for weapon in weapons:
		if weapon["ID"] == i:
			return weapon;
	return null;
	
func init_items():
	_name = "Adventurer's Sword";
	id = 1;
	path = "res://Assets/Art/Sprites/Battle/Weapons/weapon_adventurersword.png";
	description = "Just a simple Iron Sword, what more do you want me to say?";
	type = "Melee";
	minDamage = 5;
	maxDamage = 10;
	bonusAccuracy = 0;
	bonusCritRate = 0;
	element = "Earth";
	makeWeapon(_name, id, path, description, type, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);
	
	_name = "Aqua Sword";
	id = 2;
	path = "res://Assets/Art/Sprites/Battle/Weapons/weapon_aquaSword.png";
	description = "Just a simple Iron Sword imbued with the element of water.";
	type = "Melee";
	minDamage = 4;
	maxDamage = 9;
	bonusAccuracy = 0;
	bonusCritRate = 0;
	element = "Water";
	makeWeapon(_name, id, path, description, type, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);
	
	_name = "Flame Sword";
	id = 3;
	path = "res://Assets/Art/Sprites/Battle/Weapons/weapon_flameSword.png";
	description = "A sword forged with in intense heat.";
	type = "Melee";
	minDamage = 6;
	maxDamage = 11;
	bonusAccuracy = 0;
	bonusCritRate = 0;
	element = "Fire";
	makeWeapon(_name, id, path, description, type, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);
	
	_name = "Cursed Ice Sword";
	id = 4;
	path = "res://Assets/Art/Sprites/Battle/Weapons/weapon_broadIceSword.png";
	description = "The sword of a fallen warrior that has been frozen over by a curse.";
	type = "Melee";
	minDamage = 10;
	maxDamage = 15;
	bonusAccuracy = 0;
	bonusCritRate = 0;
	element = "Ice";
	makeWeapon(_name, id, path, description, type, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);
		
	_name = "Zap Sword";
	id = 5;
	path = "res://Assets/Art/Sprites/Battle/Weapons/weapon_electricSword.png";
	description = "A sword that seems to be incredibly zappy!";
	type = "Melee";
	minDamage = 8;
	maxDamage = 13;
	bonusAccuracy = 0;
	bonusCritRate = 0;
	element = "Thunder";
	makeWeapon(_name, id, path, description, type, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);
	
	
	_name = "Dark Sword";
	id = 6;
	path = "res://Assets/Art/Sprites/Battle/Weapons/weapon_darkSword.png";
	description = "A sword infused with the dark element";
	type = "Melee";
	minDamage = 12;
	maxDamage = 16;
	bonusAccuracy = 0;
	bonusCritRate = 0;
	element = "Dark";
	makeWeapon(_name, id, path, description, type, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);

	_name = "Wind Saber";
	id = 7;
	path = "res://Assets/Art/Sprites/Battle/Weapons/weapon_windSaber.png";
	description = "A saber infused with the wind element.";
	type = "Melee";
	minDamage = 8;
	maxDamage = 14;
	bonusAccuracy = 10;
	bonusCritRate = 0;
	element = "Air";
	makeWeapon(_name, id, path, description, type, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);

	_name = "Light Reaver";
	id = 8;
	path = "res://Assets/Art/Sprites/Battle/Weapons/weapon_lightReaver.png";
	description = "A large ceremonial sword once resting in a church. Good for slaying undead!";
	type = "Melee";
	minDamage = 9;
	maxDamage = 16;
	bonusAccuracy = 5;
	bonusCritRate = 0;
	element = "Light";
	makeWeapon(_name, id, path, description, type, minDamage, maxDamage, bonusAccuracy,
		bonusCritRate, element);
	
func makeWeapon(n, i, p, desc, t, minD, maxD, bA, bCR, e):
	var weapon = {};
	weapon["Name"] = n;
	weapon["ID"] = i;
	weapon["Path"] = p;
	weapon["Description"] = desc;
	weapon["Type"] = t;
	weapon["MinDamage"] = minD;
	weapon["MaxDamage"] = maxD;
	weapon["BonusAccuracy"] = bA;
	weapon["BonusCritRate"] = bCR;
	weapon["Element"] = e;
	weapons.append(weapon);
