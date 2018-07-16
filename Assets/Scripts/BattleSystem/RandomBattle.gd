extends Node

var enemies = [];

func _ready():
	init_enemies();
	
func get_random_battle():
	return enemies[0];	
	
func init_enemies():
	var name = "Green Slime";
	var maxHP = 50;
	var maxSP = 25;
	var maxMP = 25;
	var meleeDef = 10;
	var rangedDef = 10;
	var spellDef = 10;
	var minDamage = 2;
	var maxDamage = 8;
	enemies.append(make_enemy(name, maxHP, maxSP, maxMP, meleeDef, rangedDef, spellDef,
		minDamage, maxDamage));

func make_enemy(name, maxhp, maxsp, maxmp, meleeDef, rangedDef, spellDef, minD, maxD):
	var greenSlime = {};
	greenSlime["MaxHP"] = maxhp;
	greenSlime["Name"] = name;
	greenSlime["MaxSP"] = maxsp;
	greenSlime["MaxMP"] = maxmp;
	greenSlime["MeleeDef"] = meleeDef;
	greenSlime["RangedDef"] = rangedDef;
	greenSlime["SpellDef"] = spellDef;
	greenSlime["MinDamage"] = minD;
	greenSlime["MaxDamage"] = maxD;
	return greenSlime;
	
