extends Node

var locations;

func _ready():
	pass

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
		print("Getting battle data..")
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

func get_training():
	var data = {
		"Email": get_node("/root/Global").email,
		"Password" : get_node("/root/Global").password,
		"CharacterName" : get_node("/root/PlayerStats").player["Name"],
		"ToTrain" : get_node("/root/Global").trainingStat
	};
	var response = connect("/dotraining", data);
	if(response == "300"):
		print("Account data was wrong");
	elif(response == "400"):
		print("Could not find character");
	else:
		var battleJson = valid_battle_json(response);
		if(battleJson):
			return battleJson;
		else:
			print("Internal server error, bad Json");

func get_random_battle():
	var data = {
		"Email": get_node("/root/Global").email,
		"Password" : get_node("/root/Global").password	
	};
	var response = connect("/randombattle", data);
	if(response == "801"):
		print("Internal server error, query was not recieved");
	elif(response == "802"):
		print("Internal server error, query was not able to find anything");
	else:
		var battleJson = valid_battle_json(response);
		if(battleJson):
			return battleJson;
		else:
			print("Internal server error, bad Json");

func valid_character_json(text):
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
		print(json.result);
		return null;

func valid_battle_json(text):
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
		print(json.result);
		return null;