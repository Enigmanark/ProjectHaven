extends Node

var _name;
var path;
var maxHP;
var maxSP;
var maxMP;
var meleeDef;
var rangedDef;
var spellDef;
var minDamage;
var maxDamage;
var attackElement;
var earth;
var water;
var air;
var fire;
var ice;
var thunder;
var light;
var dark;

var enemies = [];

func _ready():
	init_enemies();
	
func get_random_battle():
	randomize();
	var rand = rand_range(0, enemies.size());
	print(int(rand));
	return enemies[int(rand)];
	
func init_enemies():
	_name = "Green Slime";
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/greenSlime1.tscn";
	maxHP = 50;
	maxSP = 25;
	maxMP = 25;
	meleeDef = 10;
	rangedDef = 10;
	spellDef = 10;
	minDamage = 2;
	maxDamage = 8;
	attackElement = "Earth";
	earth = 70;
	water = 90;
	air = 200;
	fire = 150;
	ice = 120;
	thunder = 50;
	light = 100;
	dark = 100;
	enemies.append(make_enemy(_name, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark));
		
	_name = "Undead Fighter";
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Undead/UndeadFighter.tscn";
	maxHP = 100;
	maxSP = 75;
	maxMP = 25;
	meleeDef = 20;
	rangedDef = 10;
	spellDef = 10;
	minDamage = 2;
	maxDamage = 8;
	attackElement = "Dark";
	earth = 80;
	water = 100;
	air = 100;
	fire = 150;
	ice = 80;
	thunder = 90;
	light = 200;
	dark = 50;
	enemies.append(make_enemy(_name, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark));
		
	_name = "Fire Slime";
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/fireSlime1.tscn";
	maxHP = 60;
	maxSP = 25;
	maxMP = 25;
	meleeDef = 10;
	rangedDef = 10;
	spellDef = 10;
	minDamage = 2;
	maxDamage = 8;
	attackElement = "Fire";
	earth = 100;
	water = 200;
	air = 100;
	fire = 70;
	ice = 50;
	thunder = 50;
	light = 100;
	dark = 100;
	enemies.append(make_enemy(_name, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark));
		
	_name = "Cold Slime";
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/coldSlime1.tscn";
	maxHP = 60;
	maxSP = 25;
	maxMP = 25;
	meleeDef = 10;
	rangedDef = 10;
	spellDef = 10;
	minDamage = 2;
	maxDamage = 8;
	attackElement = "Ice";
	earth = 100;
	water = 80;
	air = 100;
	fire = 200;
	ice = 70;
	thunder = 100;
	light = 100;
	dark = 100;
	enemies.append(make_enemy(_name, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark));

func make_enemy(name, maxhp, maxsp, maxmp, meleeDef, rangedDef, spellDef, minD, maxD, attackElement, 
	path, earth, water, air, fire, ice, thunder, light, dark):
	var enemy = {};
	enemy["MaxHP"] = maxhp;
	enemy["Path"] = path;
	enemy["Name"] = name;
	enemy["MaxSP"] = maxsp;
	enemy["MaxMP"] = maxmp;
	enemy["MeleeDef"] = meleeDef;
	enemy["RangedDef"] = rangedDef;
	enemy["SpellDef"] = spellDef;
	enemy["MinDamage"] = minD;
	enemy["MaxDamage"] = maxD;
	enemy["AttackElement"] = attackElement;
	enemy["Earth"] = earth;
	enemy["Water"] = water;
	enemy["Air"] = air;
	enemy["Fire"] = fire;
	enemy["Ice"] = ice;
	enemy["Thunder"] = thunder;
	enemy["Light"] = light;
	enemy["Dark"] = dark;
	return enemy;
	
