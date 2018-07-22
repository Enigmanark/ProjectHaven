extends Node
var player = {};

func recover_all():
	player["CurrentMP"] = player["MaxMP"];
	player["CurrentSP"] = player["MaxSP"];
	player["CurrentHP"] = player["MaxHP"];

func add_strength(amount):
	player["Strength"] += amount;
	player["CurrentStrength"] += amount;

func add_dexterity(amount):
	player["Dexterity"] += amount;
	player["CurrentDexterity"] += amount;
	
func add_endurance(amount):
	player["Endurance"] += amount;
	player["CurrentEndurance"] += amount;
	update_max_health();
	update_max_sp();
	
func add_intelligence(amount):
	player["Intelligence"] += amount;
	player["CurrentIntelligence"] += amount;
	update_max_mp();

func add_willpower(amount):
	player["Willpower"] += amount;
	player["CurrentWillpower"] += amount;
	
func add_agility(amount):
	player["Agility"] += amount;
	player["CurrentAgility"] += amount;

func get_dark():
	return player["CurrentDark"];
	
func get_light():
	return player["CurrentLight"];
	
func get_earth():
	return player["CurrentEarth"];
	
func get_water():
	return player["CurrentWater"];
	
func get_air():
	return player["CurrentAir"];
	
func get_fire():
	return player["CurrentFire"];
	
func get_ice():
	return player["CurrentIce"];
	
func get_thunder():
	return player["CurrentThunder"];

func get_strength():
	return player["CurrentStrength"];

func get_endurance():
	return player["CurrentEndurance"];
	
func get_intelligence():
	return player["CurrentIntelligence"];
	
func get_willpower():
	return player["CurrentWillpower"];
	
func get_agility():
	return player["CurrentAgility"];
	
func get_dexterity():
	return player["CurrentDexterity"];

func get_meleeDef():
	return player["CurrentMeleeDef"];
	
func get_rangedDef():
	return player["CurrentRangedDef"];

func add_experience(xp):
	player["Experience"] += xp;
	if player["Experience"] >= player["ExperienceToLevelUp"]:
		player["Experience"] -= player["ExperienceToLevelUp"];
		level_up();
		return true;
	else:
		 return false;

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

func update_max_mp():
	player["MaxMP"] = player["BaseMP"] + (player["CurrentIntelligence"] * 15);
	
func update_max_sp():
	player["MaxSP"] = player["BaseSP"] + (player["CurrentEndurance"] * 2);

func update_max_health():
	player["MaxHP"] = player["BaseHP"] + (player["CurrentEndurance"] * 10);

func add_gold(g):
	player["Gold"] += g;

func remove_gold(amount):
	player["Gold"] -= amount;
	
func has_gold(amount):
	if(player["Gold"] >= amount):
		return true;
	else:
		return false;

func level_up():
	player["TrainingPoints"] += 1;
	player["Level"] += 1;
	player["ExperienceToLevelUp"] *= 1.2;

func equip_weapon(weapon):
	player["CurrentWeapon"] = weapon;

func get_weapon():
	return get_node("/root/Weapons").get_weapon_by_id(player["CurrentWeaponID"]);

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
		
func damage_experience():
	var damage = player["ExperienceToLevelUp"] * 0.1;
	player["Experience"] -= damage;

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
	player["CurrentStrength"] = 0;
	player["CurrentEndurance"] = 0;
	player["CurrentDexterity"] = 0;
	player["CurrentIntelligence"] = 0;
	player["CurrentWillpower"] = 0;
	player["CurrentAgility"] = 0;
	player["MeleeDef"] = 0;
	player["CurrentMeleeDef"] = 0;
	player["RangedDef"] = 0;
	player["CurrentRangedDef"] = 0;
	player["SpellDef"] = 0;
	player["CurrentSpellDef"] = 0;
	player["Earth"] = 0;
	player["CurrentEarth"] = 0;
	player["Water"] = 0;
	player["CurrentWater"] = 0;
	player["Air"] = 0;
	player["CurrentAir"] = 0;
	player["Fire"] = 0;
	player["CurrentFire"] = 0;
	player["Ice"] = 0;
	player["CurrentIce"] = 0;
	player["Thunder"] = 0;
	player["CurrentThunder"] = 0;
	player["Light"] = 0;
	player["CurrentLight"] = 0;
	player["Dark"] = 0;
	player["CurrentDark"] = 0;
	player["CurrentWeaponID"] = 0;

func _ready():
	init_stats();
