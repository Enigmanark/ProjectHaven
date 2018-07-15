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
	var damage = 5;
	enemies.append(make_enemy(name, maxHP, maxSP, maxMP, damage));

func make_enemy(name, maxhp, maxsp, maxmp, d):
	var greenSlime = {};
	greenSlime["MaxHP"] = maxhp;
	greenSlime["Name"] = name;
	greenSlime["MaxSP"] = maxsp;
	greenSlime["MaxMP"] = maxmp;
	greenSlime["Damage"] = d;
	return greenSlime;
	
