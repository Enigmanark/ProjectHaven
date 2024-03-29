extends Node
var nextScenePath;
signal BattleVictory;

func _ready():
	pass;

func emit_victory_signal():
	emit_signal("BattleVictory");

func go_home():
	get_tree().change_scene("res://Assets/Scenes/haven.tscn");

func go_to_next_scene():
	get_tree().change_scene(nextScenePath);

func do_random_battle():
	var manager = get_node("/root/NetworkBattleManager");
	manager.get_random_battle();
	yield(manager, "got_battle");
	setup_battle(manager.battle);
	nextScenePath = "res://Assets/Scenes/haven.tscn";
	get_tree().change_scene("res://Assets/Scenes/battle_scene.tscn");
	
func get_background_path(location):
	if(location == "Forest"):
		return("res://Assets/Art/Battle_Backgrounds/background_trees2.png");
	elif(location == "Dark Forest"):
		return("res://Assets/Art/Battle_Backgrounds/background_darkForest.png");
	elif(location == "Beach"):
		return("res://Assets/Art/Battle_Backgrounds/background_beach.png");
	elif(location == "Desert"):
		return("res://Assets/Art/Battle_Backgrounds/background_desert.png");
	elif(location == "Dungeon"):
		return("res://Assets/Art/Battle_Backgrounds/background_dungeon.png");
	elif(location == "Glacier"):
		return("res://Assets/Art/Battle_Backgrounds/background_glacier.png");
	elif(location == "Mountains"):
		return("res://Assets/Art/Battle_Backgrounds/background_mountains.png");
	elif(location == "Plains"):
		return("res://Assets/Art/Battle_Backgrounds/background_plains.png");
	elif(location == "Volcano"):
		return("res://Assets/Art/Battle_Backgrounds/background_volcano.png");
		
func do_battle(battle, next):
	setup_battle(battle);
	nextScenePath = next;
	get_tree().change_scene("res://Assets/Scenes/battle_scene.tscn");
	
func setup_battle(battle):
	var currentBattle = get_node("/root/CurrentBattle");
	currentBattle.battleBackgroundPath = get_background_path(battle["BattleLocation"]);
	currentBattle.level = battle["Level"];
	currentBattle.id = battle["ID"];
	currentBattle.experience = battle["Experience"];
	currentBattle.gold = battle["Gold"];
	currentBattle.maxHP = battle["MaxHP"];
	currentBattle.maxMP = battle["MaxMP"];
	currentBattle.maxSP = battle["MaxSP"];
	currentBattle._name = battle["Name"];
	currentBattle.damageType = battle["DamageType"];
	currentBattle.bonusAccuracy = battle["BonusAccuracy"];
	currentBattle.bonusCrit = battle["BonusCrit"];
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
	currentBattle.agility = battle["Agility"];
	currentBattle.path = battle["Path"];
	currentBattle.pathToAvatar = battle["PathToAvatar"];
	currentBattle.earth = battle["Earth"];
	currentBattle.water = battle["Water"];
	currentBattle.air = battle["Air"];
	currentBattle.fire = battle["Fire"];
	currentBattle.ice = battle["Ice"];
	currentBattle.thunder = battle["Thunder"];
	currentBattle.light = battle["Light"];
	currentBattle.dark = battle["Dark"];