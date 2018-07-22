extends Node

func _ready():
	pass;

func get_reward(character, experience, gold):
	print("Getting reward..");
	var http = HTTPClient.new();
	var err;
	err = http.connect_to_host(get_node("/root/Global").server, get_node("/root/Global").serverPort);
	
	# Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll();
		print("Connecting..");
		OS.delay_msec(get_node("/root/Global").networkDelay);
	
	if(http.get_status() == HTTPClient.STATUS_CONNECTED):
		print("Connected!");
	else:
		quit();
	var headers = [
		"Content-Type: application/json"
    ];
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var data = { "Email" : email, "Password" : password, "Character": character,
		"Experience" : experience, "Gold" : gold };
	data = to_json(data);
	err = http.request(HTTPClient.METHOD_POST, "/updatecharacter", headers, data);
	
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		# Keep polling until the request is going on
		http.poll()
		print("Updating Character..")
		OS.delay_msec(get_node("/root/Global").networkDelay)
	
	print("response? ", http.has_response());
	
	var rb = PoolByteArray() # Array that will hold the data

	while http.get_status() == HTTPClient.STATUS_BODY:
		# While there is body left to be read
		http.poll()
		var chunk = http.read_response_body_chunk() # Get a chunk
		if chunk.size() == 0:
			# Got nothing, wait for buffers to fill a bit
			OS.delay_usec(get_node("/root/Global").networkDelay)
		else:
			rb = rb + chunk # Append to read buffer
	var text = rb.get_string_from_ascii()
	if(text == "300"):
		print("Somehow account data was invalid");
	elif(text == "400"):
		print("COULD NOT FIND CHARACTER!?");
	else:
		print("Retrieved updated character");
		var characterData = valid_json(text);
		load_character(characterData);
	
func get_last_save():
	print("Running last save");
	var http = HTTPClient.new();
	var err;
	err = http.connect_to_host(get_node("/root/Global").server, get_node("/root/Global").serverPort);
	
	# Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll();
		print("Connecting..");
		OS.delay_msec(get_node("/root/Global").networkDelay);
	
	if(http.get_status() == HTTPClient.STATUS_CONNECTED):
		print("Connected!");
	else:
		quit();
	var headers = [
		"Content-Type: application/json"
    ];
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var data = { "Email" : email, "Password" : password };
	data = to_json(data);
	err = http.request(HTTPClient.METHOD_POST, "/getcharacter", headers, data);
	
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		# Keep polling until the request is going on
		http.poll()
		print("Retrieving Character..")
		OS.delay_msec(get_node("/root/Global").networkDelay)
	
	print("response? ", http.has_response());
	
	var rb = PoolByteArray() # Array that will hold the data

	while http.get_status() == HTTPClient.STATUS_BODY:
		# While there is body left to be read
		http.poll()
		var chunk = http.read_response_body_chunk() # Get a chunk
		if chunk.size() == 0:
			# Got nothing, wait for buffers to fill a bit
			OS.delay_usec(get_node("/root/Global").networkDelay)
		else:
			rb = rb + chunk # Append to read buffer
	var text = rb.get_string_from_ascii()
	if(text == "300"):
		print("Somehow account data was invalid");
	else:
		print("Got character!");
		var characterData = valid_json(text);
		load_character(characterData);
		

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
		
func load_character(characterData):
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
	stats.player["CurrentWeaponID"] = data["CurrentWeaponID"]; 