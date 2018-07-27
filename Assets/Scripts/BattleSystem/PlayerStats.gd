extends Node
var player = {};

func recover_all():
	player["CurrentMP"] = player["MaxMP"];
	player["CurrentSP"] = player["MaxSP"];
	player["CurrentHP"] = player["MaxHP"];

func get_dark():
	var element = 1;
	element = float(element) - float(get_armor()["Dark"]);
	element = float(element) - float(get_shield()["Dark"]);
	return element;
	
func get_light():
	var element = 1;
	element = float(element) - float(get_armor()["Light"]);
	element = float(element) - float(get_shield()["Light"]);
	return element;
	
func get_earth():
	var element = 1;
	element = float(element) - float(get_armor()["Earth"]);
	element = float(element) - float(get_shield()["Earth"]);
	return element;
	
func get_water():
	var element = 1;
	element = float(element) - float(get_armor()["Water"]);
	element = float(element) - float(get_shield()["Water"]);
	return element;
	
func get_air():
	var element = 1;
	element = float(element) - float(get_armor()["Air"]);
	element = float(element) - float(get_shield()["Air"]);
	return element;
	
func get_fire():
	var element = 1;
	element = float(element) - float(get_armor()["Fire"]);
	element = float(element) - float(get_shield()["Fire"]);
	return element;
	
func get_ice():
	var element = 1;
	element = float(element) - float(get_armor()["Ice"]);
	element = float(element) - float(get_shield()["Ice"]);
	return element;
	
func get_thunder():
	var element = 1;
	element = float(element) - float(get_armor()["Thunder"]);
	element = float(element) - float(get_shield()["Thunder"]);
	return element;

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

func get_spellDef():
	var def = get_shield()["SpellDef"];
	def = def + (get_willpower() * get_node("/root/Global").spellDefWillpowerMod);	
	return def;
	
func get_meleeDef():
	var def = get_shield()["MeleeDef"];
	def = def + (get_agility() * get_node("/root/Global").meleeDefAgilityMod);
	return def;
	
func get_rangedDef():
	var def = get_shield()["RangedDef"];
	def = def + (get_agility() * get_node("/root/Global").rangedDefAgilityMod);
	return def;
	
func get_weapon_damage_type():
	return get_weapon()["Type"];

func get_bonus_accuracy():
	var bonus = get_weapon()["BonusAccuracy"];
	bonus += get_armor()["BonusAccuracy"];
	bonus += get_shield()["BonusAccuracy"];
	return bonus;

func get_bonus_crit():
	var bonus = get_weapon()["BonusCritRate"];
	bonus += get_armor()["BonusCrit"];
	bonus += get_shield()["BonusCrit"];
	return bonus;
	
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
	player["CurrentWeaponID"] = weapon["Equip"]["ID"];

func equip_shield(shield):
	player["CurrentShieldID"] = shield["Equip"]["ID"];
	
func equip_armor(armor):
	player["CurrentArmorID"] = armor["Equip"]["ID"];

func get_weapon():
	var inventory = get_node("/root/Inventory");
	return inventory.get_weapon_by_id(player["CurrentWeaponID"]);

func get_armor():
	var inventory = get_node("/root/Inventory");
	return inventory.get_armor_by_id(player["CurrentArmorID"]);

func get_shield():
	var inventory = get_node("/root/Inventory");
	return inventory.get_shield_by_id(player["CurrentShieldID"]);

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
