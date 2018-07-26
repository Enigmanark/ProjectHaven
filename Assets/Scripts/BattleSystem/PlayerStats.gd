extends Node
var player = {};

func recover_all():
	player["CurrentMP"] = player["MaxMP"];
	player["CurrentSP"] = player["MaxSP"];
	player["CurrentHP"] = player["MaxHP"];

func get_dark():
	return player["Dark"];
	
func get_light():
	return player["Light"];
	
func get_earth():
	return player["Earth"];
	
func get_water():
	return player["Water"];
	
func get_air():
	return player["Air"];
	
func get_fire():
	return player["Fire"];
	
func get_ice():
	return player["Ice"];
	
func get_thunder():
	return player["Thunder"];

func get_strength():
	return player["Strength"];

func get_endurance():
	return player["Endurance"];
	
func get_intelligence():
	return player["Intelligence"];
	
func get_willpower():
	return player["Willpower"];
	
func get_agility():
	return player["Agility"];
	
func get_dexterity():
	return player["Dexterity"];

func get_meleeDef():
	return player["MeleeDef"];
	
func get_rangedDef():
	return player["RangedDef"];

func get_weapon_damage_type():
	return get_weapon()["Type"];

func get_bonus_accuracy():
	return get_weapon()["BonusAccuracy"];

func get_bonus_crit():
	return get_weapon()["BonusCritRate"];

func restore_health(amount):
	player["CurrentHP"] += amount;
	if(player["CurrentHP"] > player["MaxHP"]):
		player["CurrentHP"] = player["MaxHP"];
		
func restore_stamina(amount):
	player["CurrentSP"] += amount;
	if(player["CurrentSP"] > player["MaxSP"]):
		player["CurrentSP"] = player["MaxSP"];
		
func restore_mana(amount):
	player["CurrentMP"] += amount;
	if(player["CurrentMP"] > player["MaxMP"]):
		player["CurrentMP"] = player["MaxMP"];
	
func has_gold(amount):
	if(player["Gold"] >= amount):
		return true;
	else:
		return false;

func equip_weapon(weapon):
	player["CurrentWeaponID"] = weapon["ID"];

func get_weapon():
	var inventory = get_node("/root/Inventory");
	return inventory.get_weapon_by_id(player["CurrentWeaponID"]);

func damage_health(amount):
	player["CurrentHP"] -= amount;
	if(player["CurrentHP"] < 0):
		player["CurrentHP"] = 0;

func damage_stamina(amount):
	player["CurrentSP"] -= amount;
	if(player["CurrentSP"] < 0):
		player["CurrentSP"] = 0;

func damage_mana(amount):
	player["CurrentMP"] -= amount;
	if(player["CurrentMP"] < 0):
		player["CurrentMP"] = 0;

func init_stats():
	player["Name"] = "";
	player["Level"] = 0;
	player["Experience"] = 0;
	player["Gold"] = 0;
	player["ExperienceToLevelUp"] = 0;
	player["TrainingPoints"] = 0;
	player["BaseHP"] = 0;
	player["MaxHP"] = 0;
	player["CurrentHP"] = 0;
	player["BaseSP"] = 0;
	player["MaxSP"] = 0;
	player["CurrentSP"] = 0;
	player["BaseMP"] = 0;
	player["MaxMP"] = 0;
	player["CurrentMP"] = 0;
	player["Strength"] = 0;
	player["Endurance"] = 0;
	player["Dexterity"] = 0;
	player["Intelligence"] = 0;
	player["Willpower"] = 0;
	player["Agility"] = 0;
	player["MeleeDef"] = 0;
	player["RangedDef"] = 0;
	player["SpellDef"] = 0;
	player["Earth"] = 0;
	player["Water"] = 0;
	player["Air"] = 0;
	player["Fire"] = 0;
	player["Ice"] = 0;
	player["Thunder"] = 0;
	player["Light"] = 0;
	player["Dark"] = 0;

func _ready():
	init_stats();
