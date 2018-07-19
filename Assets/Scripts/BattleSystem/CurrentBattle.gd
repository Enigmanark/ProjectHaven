extends Node

var _name;
var level;
var experience;
var gold;
var maxHP;
var maxSP;
var maxMP;
var minDamage;
var maxDamage;
var attackElement;
var meleeDef;
var rangedDef;
var spellDef;
var path;
var earth;
var water;
var air;
var fire;
var ice;
var thunder;
var light;
var dark;
var strength;
var dexterity;
var endurance;
var intelligence;
var willpower;
var cunning;
var pathToAvatar;

func _ready():
	pass

func get_strength():
	return strength;

func get_dexterity():
	return dexterity;
	
func get_endurance():
	return endurance;
	
func get_intelligence():
	return intelligence;
	
func get_willpower():
	return willpower;
	
func get_cunning():
	return cunning;
	
func get_meleeDef():
	return meleeDef;
	
func get_rangedDef():
	return rangedDef;
	
func get_spellDef():
	return spellDef;
