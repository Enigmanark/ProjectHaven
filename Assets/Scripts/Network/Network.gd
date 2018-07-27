extends Node

func _ready():
	pass;

func connect(route, data):
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

	var headers = [
		"Content-Type: application/json"
    ];
	data = to_json(data);
	err = http.request(HTTPClient.METHOD_POST, route, headers, data);
	
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
	return text;

func get_training(stats, trainingStat):
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var character = stats;
	character["Inventory"] = get_node("/root/Inventory").get_portable_inventory();
	var data = { "Email" : email, "Password" : password, "Character": character, "TrainingStat" : trainingStat };
	
	print("Getting training..");
	var response = connect("/getTraining", data);
	if(response == "300"):
		print("Invalid account");
		return false;
	elif(response == "400"):
		print("Could not find character");
		return false;
	elif(response == "502"):
		print("Didn't have enough gold");
		return false;
	else:
		var json = valid_json(response);
		if(json != null):
			print("Character updated!");
			load_character(json);
			return true;
		else:
			print("Server error");
			return false;
	

func player_death(stats):
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var character = stats;
	character["Inventory"] = get_node("/root/Inventory").get_portable_inventory();
	var data = { "Email" : email, "Password" : password, "Character": character };
	
	print("Updating on player death..");
	var response = connect("/playerdie", data);
	if(response == "300"):
		print("Invalid account");
	elif(response == "400"):
		print("Could not find character");
	else:
		var json = valid_json(response);
		if(json != null):
			print("Character updated!");
			load_character(json);
		else:
			print("Server error");

func get_reward(stats, id):
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var character = stats;
	character["Inventory"] = get_node("/root/Inventory").get_items();
	var data = { "Email" : email, "Password" : password, "Character": character, "EnemyID" : id};
	
	print("Getting battle reward..");
	var response = connect("/updatecharacter", data);
	if(response == "300"):
		print("Invalid account");
	elif(response == "400"):
		print("Could not find character");
	elif(response == "803"):
		print("Invalid enemy ID");
	else:
		var json = valid_json(response);
		if(json != null):
			print("Character updated!");
			load_character(json);
		else:
			print("Server error");

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
			return null;
	else:
		print("Json error");
		return null;
		
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
	stats.player["CurrentWeaponID"] = data["CurrentWeaponID"];
	stats.player["CurrentShieldID"] = data["CurrentShieldID"];
	stats.player["CurrentArmorID"] = data["CurrentArmorID"];
	get_node("/root/Inventory").load_portable_inventory(data["Inventory"]);