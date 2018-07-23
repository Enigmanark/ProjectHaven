extends Node

signal LoggedIn;

func _ready():
	pass;

func _on_SendButton_pressed():
	var username = get_node("Home/Email").text;
	var password = get_node("Home/Password").text;
	var http = HTTPClient.new();
	var err;
	err = http.connect_to_host(get_node("/root/Global").server, get_node("/root/Global").serverPort);
	# Wait until resolved
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll();
		print("Connecting..");
		OS.delay_msec(get_node("/root/Global").networkDelay);
	
	if(http.get_status() == HTTPClient.STATUS_CONNECTED):
		print("Connected!");
	elif(http.get_status() == HTTPClient.STATUS_CANT_RESOLVE):
		print("Couldn't find that server");
		return;
	elif(http.get_status() == HTTPClient.STATUS_CANT_CONNECT):
		print("Could not connect!");
		return;
	else:
		print("Couldn't connect for some reason :(");
		return;
	var headers = [
		"Content-Type: application/json"
    ];
	var data = {"Email" : username, "Password" : password};
	data = to_json(data);
	err = http.request(HTTPClient.METHOD_POST, "/login", headers, data);
	assert(err == OK)
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		# Keep polling until the request is going on
		print("Logging in..")
		http.poll()
		OS.delay_msec(get_node("/root/Global").networkDelay)
	
	assert(http.get_status() == HTTPClient.STATUS_BODY or http.get_status() == HTTPClient.STATUS_CONNECTED)
	
	print("response? ", http.has_response())
	if(http.has_response()):
		var response = PoolByteArray() # Array that will hold the data
	
		while http.get_status() == HTTPClient.STATUS_BODY:
			# While there is body left
			http.poll()
			var chunk = http.read_response_body_chunk() # Get a chunk
			if chunk.size() == 0:
				# Got nothing, wait for buffers to fill a bit
				OS.delay_usec(get_node("/root/Global").networkDelay)
			else:
				response = response + chunk # Append to read buffer
		var text = response.get_string_from_ascii()
		if(text == "200"):
			print("Logged in");
			get_node("/root/Global").email = username;
			get_node("/root/Global").password = password;
			get_node("ChooseCharacter").visible = true;
			get_node("Home").visible = false;
			emit_signal("LoggedIn");
		elif(text == "300"):
			print("There is no account with that password");
		else:
			print("Didn't get the response ;.;");

func _on_SubmitButton_pressed():
	var email = get_node("NewAccount/Email2").text;
	var password = get_node("NewAccount/VerifyPassword").text;
	var password2 = get_node("NewAccount/Password2").text;
	if(password == password2):
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
				"User-Agent: ProjectHaven (0.4.5)",
				"Content-Type: application/json"
		    ];
			var data = {"Email" : email, "Password" : password};
			data = to_json(data);
			err = http.request(HTTPClient.METHOD_POST, "/signup", headers, data);
			
			while http.get_status() == HTTPClient.STATUS_REQUESTING:
				# Keep polling until the request is going on
				http.poll()
				print("Sending..")
				OS.delay_msec(get_node("/root/Global").networkDelay)
			
			print("response? ", http.has_response())
			
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
			# Done!
			print("bytes got: ", rb.size())
			var text = rb.get_string_from_ascii()
			if(text == "200"):
				get_node("Home").visible = true;
				get_node("NewAccount").visible = false;
			elif(text == "100"):
				print("Already account with that email");
	else:
		print("Passwords did not match");


func get_last_save():
	get_node("/root/LastSave").get_last_save();
	
func _on_NewAccountButton_pressed():
	get_node("Home").visible = false;
	get_node("NewAccount").visible = true;

func _on_DevLogin_pressed():
	get_node("Home/Email").text = "johnathan.crocker@gmail.com";
	get_node("Home/Password").text = "johnathan9!";


func _on_CancelNewAccount_pressed():
	get_node("Home").visible = true;
	get_node("NewAccount").visible = false;
