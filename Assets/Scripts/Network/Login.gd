extends Node
func _ready():
	pass;

func _on_SendButton_pressed():
	var username = get_node("Home/Email").text;
	var password = get_node("Home/Password").text;
	
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
	var data = {"Email" : username, "Password" : password};
	data = to_json(data);
	err = http.request(HTTPClient.METHOD_POST, "/login", headers, data);
	
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		# Keep polling until the request is going on
		http.poll()
		print("Sending..")
		OS.delay_msec(500)
	
	print("response? ", http.has_response())
	
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
	print(text);
	if(text == "Success"):
		get_tree().change_scene("res://Assets/Scenes/haven.tscn");
	elif(text == "200"):
		print("There is no account with that password");

func _on_SubmitButton_pressed():
	var email = get_node("NewAccount/Email2").text;
	var password = get_node("NewAccount/VerifyPassword").text;
	var password2 = get_node("NewAccount/Password2").text;
	if(password == password2):
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
			var data = {"Email" : email, "Password" : password};
			data = to_json(data);
			err = http.request(HTTPClient.METHOD_POST, "/signup", headers, data);
			
			while http.get_status() == HTTPClient.STATUS_REQUESTING:
				# Keep polling until the request is going on
				http.poll()
				print("Sending..")
				OS.delay_msec(500)
			
			print("response? ", http.has_response())
			
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
			if(text == "Success"):
				get_node("Home").visible = true;
				get_node("NewAccount").visible = false;
			elif(text == "100"):
				pass;
			else:
				quit();
	else:
		print("Passwords did not match");


func _on_NewAccountButton_pressed():
	get_node("Home").visible = false;
	get_node("NewAccount").visible = true;
