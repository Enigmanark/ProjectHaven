extends Node

var locations;

var enemies = [];

func _ready():
	locations = {};
	init_locations();
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

func get_random_location():
	randomize();
	var rand = int(rand_range(0, 9));
	if(rand == 0):
		return("Forest");
	elif(rand == 1):
		return("Dungeon");
	elif(rand == 2):
		return("Volcano");
	elif(rand == 3):
		return("Glacier");
	elif(rand == 4):
		return("Dark Forest");
	elif(rand == 5):
		return("Beach");
	elif(rand == 6):
		return("Mountains");
	elif(rand == 7):
		return("Plains");
	elif(rand == 8):
		return("Desert");

func get_random_enemy_from_location(location):
	randomize();
	var enemies = locations[location];
	var rand = int(rand_range(0, enemies.size()));
	return get_battle_with_id(enemies[rand]);
	
func init_locations():
	locations = {
		"Forest" : [],
		"Dungeon" : [],
		"Plains" : [],
		"Volcano" : [],
		"Glacier" : [],
		"Dark Forest" : [],
		"Desert" : [],
		"Beach" : [],
		"Mountains" : [],
	};
	
func init_enemies():	
	var _name;
	var level
	var gold;
	var experience;
	var id;
	var path;
	var pathToAvatar;
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
	var agility;
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
	
	_name = "Green Slime";
	level = 1;
	experience = 35;
	gold = 15;
	id = 1;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/greenSlime1.tscn";
	pathToAvatar = "res://Assets/Prefabs/GUI/Avatars/AvatarGreenSlime.tscn";
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
	agility = 1;
	minDamage = 4;
	maxDamage = 8;
	attackElement = "Air";
	earth = .5;
	water = 1;
	air = .8;
	fire = 1;
	ice = 2;
	thunder = 1;
	light = 1;
	dark = 1;
	locations["Plains"].append(id);
	locations["Mountains"].append(id);
	locations["Dungeon"].append(id);
	enemies.append(make_enemy(_name, id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, agility, pathToAvatar,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark, level, experience, gold));
		
	_name = "Undead Fighter";
	level = 5;
	experience = 50;
	gold = 20;
	id = 2;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Undead/UndeadFighter.tscn";
	pathToAvatar = "res://Assets/Prefabs/GUI/Avatars/AvatarUndeadFighter.tscn";
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
	agility = 1;
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
	locations["Dungeon"].append(id);
	locations["Dark Forest"].append(id);
	enemies.append(make_enemy(_name, id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, agility, pathToAvatar,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark, level, experience, gold));
		
	_name = "Fire Slime";
	id = 3;
	level = 1;
	gold = 12;
	experience = 20;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/fireSlime1.tscn";
	pathToAvatar = "res://Assets/Prefabs/GUI/Avatars/AvatarFireSlime.tscn";
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
	agility = 1;
	minDamage = 2;
	maxDamage = 8;
	attackElement = "Fire";
	earth = 1;
	water = 2;
	air = 1;
	fire = .7;
	ice = .5;
	thunder = 1;
	light = 1;
	dark = 1;
	locations["Volcano"].append(id);
	locations["Dungeon"].append(id);
	enemies.append(make_enemy(_name, id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, agility, pathToAvatar,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark, level, experience, gold));
		
	_name = "Cold Slime";
	id = 4;
	level = 2;
	gold = 15;
	experience = 25;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/coldSlime1.tscn";
	pathToAvatar = "res://Assets/Prefabs/GUI/Avatars/AvatarColdSlime.tscn";
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
	agility = 1;
	minDamage = 3;
	maxDamage = 10;
	attackElement = "Ice";
	earth = 1;
	water = .8;
	air = .5;
	fire = 2;
	ice = .7;
	thunder = 1;
	light = 1;
	dark = 1;
	locations["Glacier"].append(id);
	locations["Dungeon"].append(id);
	enemies.append(make_enemy(_name,id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, agility, pathToAvatar,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark, level, experience, gold));
		
	_name = "Electric Slime";
	id = 5;
	level = 3;
	gold = 35;
	experience = 35;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/electricSlime.tscn";
	pathToAvatar = "res://Assets/Prefabs/GUI/Avatars/AvatarColdSlime.tscn";
	maxHP = 80;
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
	agility = 1;
	minDamage = 4;
	maxDamage = 12;
	attackElement = "Thunder";
	earth = 2;
	water = .5;
	air = 1;
	fire = 1;
	ice = 1;
	thunder = .7;
	light = 1;
	dark = 1;
	locations["Mountains"].append(id);
	locations["Beach"].append(id);
	locations["Dungeon"].append(id);
	enemies.append(make_enemy(_name,id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, agility, pathToAvatar,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark, level, experience, gold));
		
	_name = "Mud Slime";
	id = 6;
	level = 1;
	gold = 10;
	experience = 20;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/mudSlime.tscn";
	pathToAvatar = "res://Assets/Prefabs/GUI/Avatars/AvatarColdSlime.tscn";
	maxHP = 50;
	maxSP = 5;
	maxMP = 5;
	meleeDef = 15;
	rangedDef = 15;
	spellDef = 10;
	strength = 1;
	dexterity = 1;
	endurance = 1;
	intelligence = 1;
	willpower = 1;
	agility = 1;
	minDamage = 3;
	maxDamage = 10;
	attackElement = "Earth";
	earth = .7;
	water = .8;
	air = 2;
	fire = .9;
	ice = 1;
	thunder = .5;
	light = 1;
	dark = 1;
	locations["Forest"].append(id);
	locations["Plains"].append(id);
	locations["Dark Forest"].append(id);
	locations["Dungeon"].append(id);
	enemies.append(make_enemy(_name,id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, agility, pathToAvatar,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark, level, experience, gold));

	_name = "Shiny Slime";
	id = 7;
	level = 5;
	gold = 55;
	experience = 55;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/shinySlime.tscn";
	pathToAvatar = "res://Assets/Prefabs/GUI/Avatars/AvatarColdSlime.tscn";
	maxHP = 110;
	maxSP = 50;
	maxMP = 50;
	meleeDef = 15;
	rangedDef = 20;
	spellDef = 10;
	strength = 1;
	dexterity = 1;
	endurance = 1;
	intelligence = 1;
	willpower = 1;
	agility = 1;
	minDamage = 5;
	maxDamage = 15;
	attackElement = "Light";
	earth = 1;
	water = 1.5;
	air = .8;
	fire = .8;
	ice = 1;
	thunder = 1;
	light = .5;
	dark = 2;
	locations["Desert"].append(id);
	locations["Dungeon"].append(id);
	enemies.append(make_enemy(_name,id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, agility, pathToAvatar,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark, level, experience, gold));
		
	_name = "Void Slime";
	id = 8;
	level = 4;
	gold = 35;
	experience = 45;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/voidSlime.tscn";
	pathToAvatar = "res://Assets/Prefabs/GUI/Avatars/AvatarColdSlime.tscn";
	maxHP = 90;
	maxSP = 25;
	maxMP = 25;
	meleeDef = 10;
	rangedDef = 10;
	spellDef = 30;
	strength = 1;
	dexterity = 1;
	endurance = 1;
	intelligence = 1;
	willpower = 1;
	agility = 1;
	minDamage = 3;
	maxDamage = 10;
	attackElement = "Dark";
	earth = 1;
	water = 1;
	air = 1;
	fire = 1.2;
	ice = 1.2;
	thunder = 1;
	light = 2;
	dark = .5;
	locations["Dark Forest"].append(id);
	locations["Dungeon"].append(id);
	enemies.append(make_enemy(_name,id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, agility, pathToAvatar,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark, level, experience, gold));

	_name = "Drippy Slime";
	id = 9;
	level = 2;
	gold = 15;
	experience = 25;
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/waterSlime.tscn";
	pathToAvatar = "res://Assets/Prefabs/GUI/Avatars/AvatarColdSlime.tscn";
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
	agility = 1;
	minDamage = 3;
	maxDamage = 10;
	attackElement = "Water";
	earth = 1;
	water = .7;
	air = 1;
	fire = .5;
	ice = .9;
	thunder = 2;
	light = 1;
	dark = 1;
	locations["Beach"].append(id);
	locations["Dungeon"].append(id);
	enemies.append(make_enemy(_name,id, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		strength, dexterity, endurance, intelligence, willpower, agility, pathToAvatar,
		minDamage, maxDamage, attackElement, path, earth, water, air, fire, ice, thunder,
		light, dark, level, experience, gold));

func make_enemy(name, id, maxhp, maxsp, maxmp, meleeDef, rangedDef, spellDef, strength, dexterity,
	endurance, intelligence, willpower, agility, pathToAvatar, minD, maxD, attackElement,
	path, earth, water, air, fire, ice, thunder, light, dark, level, experience, gold):
	var enemy = {};
	enemy["Level"] = level;
	enemy["Experience"] = experience;
	enemy["Gold"] = gold;
	enemy["MaxHP"] = maxhp;
	enemy["Path"] = path;
	enemy["PathToAvatar"] = pathToAvatar;
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
	enemy["Agility"] = agility;
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
	
