extends Node

var username;
var password;
var characterData;

var save;

func _ready():
	pass;

func get_last_save():
	print("Running last save");
	var http = HTTPClient.new();
	var err;
	err = http.connect_to_host("http://127.0.0.1", 6007);
	
	# Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll();
		print("Connecting..");
		OS.delay_msec(500);
	
	if(http.get_status() == HTTPClient.STATUS_CONNECTED):
		print("Connected!");
	else:
		quit();
	var headers = [
		"User-Agent: ProjectHaven (0.4.5)",
		"Content-Type: application/json"
    ];
	var data = { "Email" : username, "Password" : password };
	data = to_json(data);
	err = http.request(HTTPClient.METHOD_GET, "/getcharacter", headers, data);
	
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		# Keep polling until the request is going on
		http.poll()
		print("Retrieving Character..")
		OS.delay_msec(500)
	
	print("response? ", http.has_response());
	
	var rb = PoolByteArray() # Array that will hold the data

	while http.get_status() == HTTPClient.STATUS_BODY:
		# While there is body left to be read
		http.poll()
		var chunk = http.read_response_body_chunk() # Get a chunk
		if chunk.size() == 0:
			# Got nothing, wait for buffers to fill a bit
			OS.delay_usec(500)
		else:
			rb = rb + chunk # Append to read buffer
	# Done!
	print("bytes got: ", rb.size())
	var text = rb.get_string_from_ascii()
	if(text == "300"):
		print("Somehow account data was invalid");
	else:
		print("Got character!");
		characterData = valid_json(text);
		load_character();

func valid_json(text):
	print("Checking json");
	var json = JSON.parse(text);
	if(json.error == OK):
		var data = json.result;
		if(data.has("Name") and typeof(data["Name"]) == TYPE_STRING):
			print("Got valid json");
			return data;
		else:
			print("Property not present");
	else:
		print("Json error");
		
func load_character():
	print("Loading character");
	var data = characterData;
	var stats = get_node("/root/PlayerStats");
	stats.player["Name"] = data["Name"];
	stats.player["Level"] = data["Level"];
	stats.player["Gold"] = data["Gold"];
	stats.player["Experience"] = data["Experience"];
	stats.player["ExperienceToLevelUp"] = data["ExperienceToLevelUp"];
	stats.player["TrainingPoints"] = data["TrainingPoints"];
	stats.player["BaseHP"] = data["BaseHP"];
	stats.player["MaxHP"] = data["MaxHP"];
	stats.player["CurrentHP"] = data["CurrentHP"];
	stats.player["BaseSP"] = data["BaseSP"];
	stats.player["MaxSP"] = data["MaxSP"];
	stats.player["CurrentSP"] = data["CurrentSP"];
	stats.player["BaseMP"] = data["BaseMP"];
	stats.player["MaxMP"] = data["MaxMP"];
	stats.player["CurrentMP"] = data["CurrentMP"];
	stats.player["Strength"] = data["Strength"];
	stats.player["Endurance"] = data["Endurance"];
	stats.player["Dexterity"] = data["Dexterity"];
	stats.player["Intelligence"] = data["Intelligence"];
	stats.player["Willpower"] = data["Willpower"];
	stats.player["Agility"] = data["Agility"];
	stats.player["CurrentStrength"] = data["CurrentStrength"];
	stats.player["CurrentEndurance"] = data["CurrentEndurance"];
	stats.player["CurrentDexterity"] = data["CurrentDexterity"]; 
	stats.player["CurrentIntelligence"] = data["CurrentIntelligence"];
	stats.player["CurrentWillpower"] = data["CurrentWillpower"];
	stats.player["CurrentAgility"] = data["CurrentAgility"]; 
	stats.player["MeleeDef"] = data["MeleeDef"];
	stats.player["CurrentMeleeDef"] = data["CurrentMeleeDef"];
	stats.player["RangedDef"] = data["RangedDef"];
	stats.player["CurrentRangedDef"] = data["CurrentRangedDef"];
	stats.player["SpellDef"] = data["SpellDef"]; 
	stats.player["CurrentSpellDef"] = data["CurrentSpellDef"]; 
	stats.player["Earth"] = data["Earth"];
	stats.player["CurrentEarth"] = data["CurrentEarth"];
	stats.player["Water"] = data["Water"];
	stats.player["CurrentWater"] = data["CurrentWater"];
	stats.player["Air"] = data["Air"];
	stats.player["CurrentAir"] = data["CurrentAir"];
	stats.player["Fire"] = data["Fire"];
	stats.player["CurrentFire"] = data["CurrentFire"];
	stats.player["Ice"] = data["Ice"];
	stats.player["CurrentIce"] = data["CurrentIce"];
	stats.player["Thunder"] = data["Thunder"];
	stats.player["CurrentThunder"] = data["CurrentThunder"];
	stats.player["Light"] = data["Light"];
	stats.player["CurrentLight"] = data["CurrentLight"];
	stats.player["Dark"] = data["Dark"];
	stats.player["CurrentDark"] = data["CurrentDark"];
	stats.player["CurrentWeapon"] = get_node("/root/Weapons").get_weapon_by_id(data["CurrentWeaponID"]); 