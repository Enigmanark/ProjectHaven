extends Node

signal got_response;
signal character_loaded;
var response;
var shopInventory;
var didTrainingSucceed;
var buySuccessful;

func _ready():
	pass;

func get_haven_blacksmith_inventory():
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var data = { "Email" : email, "Password" : password };
	
	print("Retrieving blacksmith inventory..");
	connect("/gethavenblacksmithinventory", data);
	yield(self, "got_response");
	if(response == "300"):
		print("Invalid account");
	elif(response == "401"):
		print("Could not get data");
	else:
		var json = valid_shop(response);
		if(json != null):
			print("Got shop data!");
			shopInventory = json;
		else:
			print("Server error");
			
func buy_item(type, id):
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var character = get_node("/root/PlayerStats").player;
	character["Inventory"] = get_node("/root/Inventory").get_items();
	var data = { "Email" : email, "Password" : password, "Character" : character, "Type" : type, "ID" : id };
	print("Buying item..");
	connect("/buyitem", data);
	yield(self, "got_response");
	if(response == "300"):
		buySuccessful = false;
		print("Invalid account");
		emit_signal("character_loaded");
	elif(response == "401"):
		buySuccessful = false;
		print("Could not get data");
		emit_signal("character_loaded");
	elif(response == "606"):
		buySuccessful = false;
		print("Not enough gold");
		emit_signal("character_loaded");
	elif(response == "605"):
		buySuccessful = false;
		print("No space");
		emit_signal("character_loaded");
	else:
		var json = valid_json(response);
		if(json != null):
			buySuccessful = true;
			load_character(json);
		else:
			print("Server error");
			buySuccessful = false;
			emit_signal("character_loaded");

func connect(route, data):
	yield(get_tree(), "idle_frame");
	var http = HTTPClient.new();
	var err;
	err = http.connect_to_host(get_node("/root/Global").server, get_node("/root/Global").serverPort);
	# Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		yield(get_tree(), "idle_frame");
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
		yield(get_tree(), "idle_frame");
		# Keep polling until the request is going on
		http.poll()
		print("Updating Character..")
		OS.delay_msec(get_node("/root/Global").networkDelay)
	
	print("response? ", http.has_response());
	
	var rb = PoolByteArray() # Array that will hold the data

	while http.get_status() == HTTPClient.STATUS_BODY:
		yield(get_tree(), "idle_frame");
		# While there is body left to be read
		http.poll()
		var chunk = http.read_response_body_chunk() # Get a chunk
		if chunk.size() == 0:
			# Got nothing, wait for buffers to fill a bit
			OS.delay_usec(get_node("/root/Global").networkDelay)
		else:
			rb = rb + chunk # Append to read buffer
	var text = rb.get_string_from_ascii()
	response = text;
	emit_signal("got_response");

func get_training(stats, trainingStat):
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var character = stats;
	character["Inventory"] = get_node("/root/Inventory").get_items();
	var data = { "Email" : email, "Password" : password, "Character": character, "TrainingStat" : trainingStat };
	print("Getting training..");
	connect("/getTraining", data);
	yield(self, "got_response");
	if(response == "300"):
		print("Invalid account");
		didTrainingSucceed = false;
		emit_signal("character_loaded");
	elif(response == "400"):
		print("Could not find character");
		didTrainingSucceed = false;
		emit_signal("character_loaded");
	elif(response == "502"):
		print("Didn't have enough gold");
		didTrainingSucceed = false;
		emit_signal("character_loaded");
	else:
		var json = valid_json(response);
		if(json != null):
			print("Character updated!");
			load_character(json);
			didTrainingSucceed = true;
			emit_signal("character_loaded");
		else:
			print("Server error");
			didTrainingSucceed = false;
			emit_signal("character_loaded");
	

func player_death(stats):
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var character = stats;
	character["Inventory"] = get_node("/root/Inventory").get_items();
	var data = { "Email" : email, "Password" : password, "Character": character };
	
	print("Updating on player death..");
	var response = connect("/playerdie", data);
	yield(self, "got_response");
	if(response == "300"):
		print("Invalid account");
	elif(response == "400"):
		print("Could not find character");
	else:
		var json = valid_json(response);
		if(json != null):
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
	connect("/updatecharacter", data);
	yield(self, "got_response");
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

func valid_shop(text):
	print("Checking json");
	var json = JSON.parse(text);
	if(json.error == OK):
		var data = json.result;
		if(data.has("Weapons") and typeof(data["Weapons"]) == TYPE_ARRAY):
			print("JSON is valid inventory");
			return data;
		else:
			print("JSON error");
	else:
		print("JSON error");

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
	print("Character updated!");
	emit_signal("character_loaded");