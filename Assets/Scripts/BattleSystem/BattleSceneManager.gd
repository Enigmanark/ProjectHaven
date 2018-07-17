extends Node

func _ready():
	pass

func return_to_haven():
	get_tree().change_scene("res://Assets/Scenes/haven.tscn");

func do_random_battle():
	var battle = get_node("/root/RandomBattle").get_random_battle();
	var currentBattle = get_node("/root/CurrentBattle");
	currentBattle.maxHP = battle["MaxHP"];
	currentBattle.maxMP = battle["MaxMP"];
	currentBattle.maxSP = battle["MaxSP"];
	currentBattle._name = battle["Name"];
	currentBattle.minDamage = battle["MinDamage"];
	currentBattle.maxDamage = battle["MaxDamage"];
	currentBattle.attackElement = battle["AttackElement"];
	currentBattle.meleeDef = battle["MeleeDef"];
	currentBattle.rangedDef = battle["RangedDef"];
	currentBattle.spellDef = battle["SpellDef"];
	currentBattle.strength = battle["Strength"];
	currentBattle.dexterity = battle["Dexterity"];
	currentBattle.endurance = battle["Endurance"];
	currentBattle.intelligence = battle["Intelligence"];
	currentBattle.willpower = battle["Willpower"];
	currentBattle.charisma = battle["Charisma"];
	currentBattle.luck = battle["Luck"];
	currentBattle.path = battle["Path"];
	currentBattle.earth = battle["Earth"];
	currentBattle.water = battle["Water"];
	currentBattle.air = battle["Air"];
	currentBattle.fire = battle["Fire"];
	currentBattle.ice = battle["Ice"];
	currentBattle.thunder = battle["Thunder"];
	currentBattle.light = battle["Light"];
	currentBattle.dark = battle["Dark"];
	get_tree().change_scene("res://Assets/Scenes/battle_scene.tscn");