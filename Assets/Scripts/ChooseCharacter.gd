extends Node2D

var maxCharacters = false;
var choose;

func _ready():
	pass;

func _on_NewButton_pressed():
	get_node("NewCharacter?").visible = true;


func get_character(nameOfCharacter):
	get_node("../Screen").show_message("Loading...");
	choose = nameOfCharacter;
	connect_chooseCharacter();

func connect_chooseCharacter():
	print("Attempting to retrieve character..");
	var http = HTTPClient.new();
	var err;
	err = http.connect_to_host(get_node("/root/Global").server, get_node("/root/Global").serverPort);
	yield(get_tree(), "idle_frame");
	# Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		yield(get_tree(), "idle_frame");
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
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var charName = choose;
	var data = { "Email" : email, "Password" : password , "Name" : charName};
	data = to_json(data);
	
	err = http.request(HTTPClient.METHOD_POST, "/getcharacter", headers, data);
	
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
	http.close();
	var text = rb.get_string_from_ascii()
	if(text == "400"):
		print("Could not find character");
		get_node("../Screen").hide_message();
	elif(text == "300"):
		print("Account data credentials were invalid");
		get_node("../Screen").hide_message();
	else:
		var json = valid_character(text);
		if(json):
			get_node("/root/Network").load_character(json);
			get_node("/root/Main").set_orientation();
			get_tree().change_scene("res://Assets/Scenes/haven.tscn");

func _on_Char1_pressed():
	var c = get_node("/root/Global").char1;
	if(c != null):
		get_character(c);

func _on_Char2_pressed():
	var c = get_node("/root/Global").char2;
	if(c != null):
		get_character(c);

func _on_Char3_pressed():
	var c = get_node("/root/Global").char3;
	if(c != null):
		get_character(c);

func _on_Char4_pressed():
	var c = get_node("/root/Global").char4;
	if(c != null):
		get_character(c);

func _on_Char5_pressed():
	var c = get_node("/root/Global").char5;
	if(c != null):
		get_character(c);


func _on_Make_pressed():
	make_new_character()
	get_node("NewCharacter?").visible = false;
		
func get_characters():
	get_node("../Screen").show_message("Retrieving...");
	print("Attempting to retrieve characters..");
	var http = HTTPClient.new();
	var err;
	yield(get_tree(), "idle_frame");
	err = http.connect_to_host(get_node("/root/Global").server, get_node("/root/Global").serverPort);
	# Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		yield(get_tree(), "idle_frame");
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
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var charName = get_node("NewCharacter?/NameLine").text;
	var data = { "Email" : email, "Password" : password };
	data = to_json(data);
	
	err = http.request(HTTPClient.METHOD_POST, "/choosecharacter", headers, data);
	
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		yield(get_tree(), "idle_frame");
		# Keep polling until the request is going on
		http.poll()
		print("Getting Characters..")
		OS.delay_msec(500)
	
	print("response? ", http.has_response());
	
	var rb = PoolByteArray() # Array that will hold the data

	while http.get_status() == HTTPClient.STATUS_BODY:
		yield(get_tree(), "idle_frame");
		# While there is body left to be read
		http.poll()
		var chunk = http.read_response_body_chunk() # Get a chunk
		if chunk.size() == 0:
			# Got nothing, wait for buffers to fill a bit
			OS.delay_usec(500)
		else:
			rb = rb + chunk # Append to read buffer
	var text = rb.get_string_from_ascii()
	if(text == "300"):
		print("Somehow account data was invalid");
		get_node("../Screen").hide_message();
		return false;
	elif(text == "2000"):
		print("No characters");
		get_node("../Screen").hide_message();
		load_buttons([]);
	else:
		var json = valid_json(text);
		if(!json):
			print("Character data corrupt");
			get_node("../Screen").hide_message();
		else:
			load_buttons(json);
			get_node("../Screen").hide_message();
	http.close();

func valid_character(text):
	print("Checking json");
	var json = JSON.parse(text);
	if(json.error == OK):
		var data = json.result;
		if(typeof(data["Name"]) == TYPE_STRING):
			print("Got valid json");
			return data;
		else:
			print("Property not present");
			print(json.result);
	else:
		print("Json error");
		print(json.result);
		return false;
		
func valid_json(text):
	print("Checking json");
	var json = JSON.parse(text);
	if(json.error == OK):
		var data = json.result;
		if(typeof(data[0]["Name"]) == TYPE_STRING):
			print("Got valid json");
			return data;
		else:
			print("Property not present");
			print(json.result);
	else:
		print("Json error");
		print(json.result);
		return false;

func make_new_character():
	get_node("../Screen").show_message("Creating...");
	print("Attempting to make new character..");
	var http = HTTPClient.new();
	var err;
	err = http.connect_to_host(get_node("/root/Global").server, get_node("/root/Global").serverPort);
	yield(get_tree(), "idle_frame");
	# Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		yield(get_tree(), "idle_frame");
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
	var email = get_node("/root/Global").email;
	var password = get_node("/root/Global").password;
	var charName = get_node("NewCharacter?/NameLine").text;
	var data = { "Email" : email, "Password" : password , "Name" : charName};
	data = to_json(data);
	
	err = http.request(HTTPClient.METHOD_POST, "/makecharacter", headers, data);
	
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		yield(get_tree(), "idle_frame");
		# Keep polling until the request is going on
		http.poll()
		print("Making Character..")
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
	http.close();
	var text = rb.get_string_from_ascii()
	if(text == "300"):
		get_node("../Screen").show_ok_message("Character Creation Failed");
	elif(text == "600"):
		print("Too many characters have already been created for this account");
		get_node("../Screen").show_ok_message("Character Creation Failed");
	elif(text == "603"):
		get_node("../Screen").show_ok_message("Already character with that name");
	elif(text == "500"):
		print("Character creation successful!");
		get_characters();
	else:
		print("Something went horribly wrong..");
		get_node("../Screen").show_ok_message("Character Creation Failed");
		
func load_buttons(data):
	if(data.size() == 1):
		var name = data[0]["Name"];
		var level = data[0]["Level"];
		get_node("Char1").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char1 = name;
	elif(data.size() == 2):
		var name = data[0]["Name"];
		var level = data[0]["Level"];
		get_node("Char1").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char1 = name;
		name = data[1]["Name"];
		level = data[1]["Level"];
		get_node("Char2").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char2 = name;
	elif(data.size() == 3):
		var name = data[0]["Name"];
		var level = data[0]["Level"];
		get_node("Char1").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char1 = name;
		name = data[1]["Name"];
		level = data[1]["Level"];
		get_node("Char2").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char2 = name;
		name = data[2]["Name"];
		level = data[2]["Level"];
		get_node("Char3").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char3 = name;
	elif(data.size() == 4):
		var name = data[0]["Name"];
		var level = data[0]["Level"];
		get_node("Char1").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char1 = name;
		name = data[1]["Name"];
		level = data[1]["Level"];
		get_node("Char2").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char2 = name;
		name = data[2]["Name"];
		level = data[2]["Level"];
		get_node("Char3").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char3 = name;
		name = data[3]["Name"];
		level = data[3]["Level"];
		get_node("Char4").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char4 = name;
	elif(data.size() == 5):
		var name = data[0]["Name"];
		var level = data[0]["Level"];
		get_node("Char1").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char1 = name;
		name = data[1]["Name"];
		level = data[1]["Level"];
		get_node("Char2").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char2 = name;
		name = data[2]["Name"];
		level = data[2]["Level"];
		get_node("Char3").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char3 = name;
		name = data[3]["Name"];
		level = data[3]["Level"];
		get_node("Char4").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char4 = name;
		name = data[4]["Name"];
		level = data[4]["Level"];
		get_node("Char5").text = name + " " + "Level " + str(level);
		get_node("/root/Global").char5 = name;
		get_node("NewButton").visible = false;
