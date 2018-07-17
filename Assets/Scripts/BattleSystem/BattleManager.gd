extends Node

var _name;
var id;
var path;
var maxHP;
var maxSP;
var maxMP;
var meleeDef;
var rangedDef;
var spellDef;
var strength;
var dexterity;
var endurance;
var intelligence;
var willpower;
var charisma;
var luck;
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

func has_battle_with_id(id):
	for enemy in enemies:
		if enemy["ID"] == int(id):
			return true;
	return false;
	
func get_battle_with_id(id):
	for enemy in enemies:
		if enemy["ID"] == int(id):
			return enemy;
	return null;

func get_random_battle():
	randomize();
	var rand = rand_range(0, enemies.size());
	return enemies[int(rand)];
	
func init_enemies():
	_name = "Green Slime";
	id = 1;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/greenSlime1.tscn";
	maxHP = 50;
	maxSP = 25;
	maxMP = 25;
	meleeDef = 10;
	rangedDef = 10;
	spellDef = 10;
	strength = 1;
	dexterity = 1;
	endurance = 1;
	intelligence = 1;
	willpower = 1;
	charisma = 1;
	luck = 1;
	minDamage = 2;
	maxDamage = 8;
	attackElement = "Earth";
	earth = .7;
	water = .9;
	air = 2;
	fire = 1.5;
	ice = 1.2;
	thunder = .5;
	light = 1;
	dark = 1;
	enemies.append(make_enemy(_name, id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, charisma, luck,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark));
		
	_name = "Undead Fighter";
	id = 2;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Undead/UndeadFighter.tscn";
	maxHP = 100;
	maxSP = 75;
	maxMP = 25;
	meleeDef = 20;
	rangedDef = 10;
	spellDef = 10;
	strength = 5;
	dexterity = 3;
	endurance = 1;
	intelligence = 1;
	willpower = 1;
	charisma = 1;
	luck = 1;
	minDamage = 2;
	maxDamage = 8;
	attackElement = "Dark";
	earth = .8;
	water = 1;
	air = 1;
	fire = 1.5;
	ice = .8;
	thunder = .9;
	light = 2;
	dark = .50;
	enemies.append(make_enemy(_name, id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, charisma, luck,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark));
		
	_name = "Fire Slime";
	id = 3;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/fireSlime1.tscn";
	maxHP = 60;
	maxSP = 25;
	maxMP = 25;
	meleeDef = 10;
	rangedDef = 10;
	spellDef = 10;
	strength = 1;
	dexterity = 1;
	endurance = 1;
	intelligence = 1;
	willpower = 1;
	charisma = 1;
	luck = 1;
	minDamage = 2;
	maxDamage = 8;
	attackElement = "Fire";
	earth = 1;
	water = 2;
	air = 1;
	fire = .7;
	ice = .5;
	thunder = .5;
	light = 1;
	dark = 1;
	enemies.append(make_enemy(_name, id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, charisma, luck,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark));
		
	_name = "Cold Slime";
	id = 4;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/coldSlime1.tscn";
	maxHP = 60;
	maxSP = 25;
	maxMP = 25;
	meleeDef = 10;
	rangedDef = 10;
	spellDef = 10;
	strength = 1;
	dexterity = 1;
	endurance = 1;
	intelligence = 1;
	willpower = 1;
	charisma = 1;
	luck = 1;
	minDamage = 2;
	maxDamage = 8;
	attackElement = "Ice";
	earth = 1;
	water = .8;
	air = 1;
	fire = 2;
	ice = .7;
	thunder = 1;
	light = 1;
	dark = 1;
	enemies.append(make_enemy(_name,id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, charisma, luck,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark));

func make_enemy(name, id, maxhp, maxsp, maxmp, meleeDef, rangedDef, spellDef, strength, dexterity,
	endurance, intelligence, willpower, charisma, luck, minD, maxD, attackElement, 
	path, earth, water, air, fire, ice, thunder, light, dark):
	var enemy = {};
	enemy["MaxHP"] = maxhp;
	enemy["Path"] = path;
	enemy["Name"] = name;
	enemy["ID"] = id;
	enemy["MaxSP"] = maxsp;
	enemy["MaxMP"] = maxmp;
	enemy["MeleeDef"] = meleeDef;
	enemy["RangedDef"] = rangedDef;
	enemy["SpellDef"] = spellDef;
	enemy["Strength"] = strength;
	enemy["Dexterity"] = dexterity;
	enemy["Endurance"] = endurance;
	enemy["Intelligence"] = intelligence;
	enemy["Willpower"] = willpower;
	enemy["Charisma"] = charisma;
	enemy["Luck"] = luck;
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
	
