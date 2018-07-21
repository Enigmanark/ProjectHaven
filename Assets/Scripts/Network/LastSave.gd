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
	var player = get_node("/root/PlayerStats");
	player._name = data["Name"];
	player.level = data["Level"];

