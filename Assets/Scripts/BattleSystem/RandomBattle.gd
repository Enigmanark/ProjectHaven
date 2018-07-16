extends Node

var enemies = [];

func _ready():
	init_enemies();
	
func get_random_battle():
	randomize();
	var rand = rand_range(0, 2);
	print(int(rand));
	return enemies[int(rand)];
	
func init_enemies():
	var name = "Green Slime";
	var path = "res://Assets/Prefabs/BattleSystem/Enemies/Slimes/greenSlime1.tscn";
	var maxHP = 50;
	var maxSP = 25;
	var maxMP = 25;
	var meleeDef = 10;
	var rangedDef = 10;
	var spellDef = 10;
	var minDamage = 2;
	var maxDamage = 8;
	enemies.append(make_enemy(name, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		minDamage, maxDamage, path));
		
	name = "Undead Fighter";
	path = "res://Assets/Prefabs/BattleSystem/Enemies/Undead/UndeadFighter.tscn";
	maxHP = 100;
	maxSP = 75;
	maxMP = 25;
	meleeDef = 20;
	rangedDef = 10;
	spellDef = 10;
	minDamage = 2;
	maxDamage = 8;
	enemies.append(make_enemy(name, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		minDamage, maxDamage, path));

func make_enemy(name, maxhp, maxsp, maxmp, meleeDef, rangedDef, spellDef, minD, maxD, path):
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
	return enemy;
	
