extends Node
var _name = "Solar";
export(int) var maxhp;
var currentHP;
export(int) var maxsp;
var currentSP;
export(int) var maxmp;
var currentMP;
var strength = 1;
var currentStrength = strength;
var dexterity = 1;
var currentDexterity = dexterity;
var endurance = 1;
var currentEndurance = endurance;
var intelligence = 1;
var currentIntelligence = intelligence;
var willpower = 1;
var currentWillpower = willpower;
var charisma = 1;
var currentCharisma = charisma;
var luck = 1;
var currentLuck = luck;
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

var attackElement = "Earth";
var minDamage = 5;
var maxDamage = 10;

func addStrength(amount):
	strength += amount;
	currentStrength += amount;

func addDexterity(amount):
	dexterity += amount;
	currentDexterity += amount;
	
func addEndurance(amount):
	endurance += amount;
	currentEndurance += amount;
	
func addIntelligence(amount):
	intelligence += amount;
	currentIntelligence += amount;

func addWillpower(amount):
	willpower += amount;
	currentWillpower += amount;
	
func addCharisma(amount):
	charisma += amount;
	currentCharisma += amount;
	
func addLuck(amount):
	luck += amount;
	currentLuck += amount;

func get_dexterity():
	return currentDexterity;

func get_meleeDef():
	return currentMeleeDef;
	
func get_rangedDef():
	return currentRangedDef;

func _ready():
	currentHP = maxhp;
	currentSP = maxsp;
	currentMP = maxmp;
