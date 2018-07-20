extends Node
var _name = "Solar";
var level = 0;
var experience = 0;
var gold = 0;
var experienceToLevelUp = 100;
var trainingPoints = 0;
var baseHP = 75;
var maxhp = 75;
var currentHP;
var baseSP = 25;
var maxsp = 25;
var currentSP;
var baseMP = 0;
var maxmp = 0;
var currentMP;
var strength = 0;
var currentStrength = strength;
var dexterity = 0;
var currentDexterity = dexterity;
var endurance = 0;
var currentEndurance = endurance;
var intelligence = 0;
var currentIntelligence = intelligence;
var willpower = 0;
var currentWillpower = willpower;
var cunning = 0;
var currentCunning = cunning;
var meleeDef = 10;
var currentMeleeDef = meleeDef;
var rangedDef = 10;
var currentRangedDef = rangedDef;
var spellDef = 10;
var currentSpelDef = spellDef;
var earth = 1;
var currentEarth = earth;
var water = 1;
var currentWater = water;
var air = 1;
var currentAir = air;
var fire = 1;
var currentFire = fire;
var ice = 1;
var currentIce = ice;
var thunder = 1;
var currentThunder = thunder;
var light = 1;
var currentLight = light;
var dark = 1;
var currentDark = dark;
var currentWeapon;

func recover_all():
	currentMP = maxmp;
	currentSP = maxsp;
	currentHP = maxhp;

func add_strength(amount):
	strength += amount;
	currentStrength += amount;

func add_dexterity(amount):
	dexterity += amount;
	currentDexterity += amount;
	
func add_endurance(amount):
	endurance += amount;
	currentEndurance += amount;
	update_max_health();
	update_max_sp();
	
func add_intelligence(amount):
	intelligence += amount;
	currentIntelligence += amount;
	update_max_mp();

func add_willpower(amount):
	willpower += amount;
	currentWillpower += amount;
	
func add_cunning(amount):
	cunning += amount;
	currentCunning += amount;

func get_strength():
	return currentStrength;

func get_endurance():
	return currentEndurance;
	
func get_intelligence():
	return currentIntelligence;
	
func get_willpower():
	return currentWillpower;
	
func get_cunning():
	return currentCunning;
	
func get_dexterity():
	return currentDexterity;

func get_meleeDef():
	return currentMeleeDef;
	
func get_rangedDef():
	return currentRangedDef;

func add_experience(xp):
	experience += xp;
	if experience >= experienceToLevelUp:
		experience -= experienceToLevelUp;
		level_up();
		return true;
	else:
		 return false;

func update_max_mp():
	maxmp = baseMP + (currentIntelligence * 15);
	
func update_max_sp():
	maxsp = baseSP + (currentEndurance * 2);

func update_max_health():
	maxhp = baseHP + (currentEndurance * 10)

func add_gold(g):
	gold += g;

func remove_gold(amount):
	gold -= amount;
	
func has_gold(amount):
	if(gold >= amount):
		return true;
	else:
		return false;

func level_up():
	trainingPoints += 1;
	level += 1;
	experienceToLevelUp *= 1.2;

func equip_weapon(weapon):
	currentWeapon = weapon;

func get_weapon():
	return currentWeapon;

func init_beginner():
	var sword = get_node("/root/Weapons").get_weapon_by_id(1);
	get_node("/root/Inventory").add_weapon(sword);
	equip_weapon(sword);
	var asword = get_node("/root/Weapons").get_weapon_by_id(2);
	get_node("/root/Inventory").add_weapon(asword);
	var fsword = get_node("/root/Weapons").get_weapon_by_id(3);
	get_node("/root/Inventory").add_weapon(fsword);

func on_WeaponsInitialized():
	init_beginner();

func _ready():
	currentHP = maxhp;
	currentSP = maxsp;
	currentMP = maxmp;
	get_node("/root/Weapons").connect("WeaponsInitialized", self, "on_WeaponsInitialized");
