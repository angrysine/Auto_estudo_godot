extends Node2D

var connection = false

func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	$update.connect("pressed",self,"_on_update_button_pressed")
	$move_to.connect("pressed",self,"move_to_point")
	$get_position.connect("pressed",self,"move_to_id")
	$HTTPRequest.request("http://127.0.0.1:5000/get")
	
	
func _make_get_request(url, data_to_send, use_ssl):
	# Convert data to json string:
	var query = JSON.print(data_to_send)
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, use_ssl, HTTPClient.METHOD_GET, query)
	
func _make_post_request(url, data_to_send, use_ssl):
	# Convert data to json string:
	var query = JSON.print(data_to_send)
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, use_ssl, HTTPClient.METHOD_POST, query)
	
func _on_Button_pressed():
	if connection:
		$HTTPRequest.request("http://127.0.0.1:5000/")

func _on_update_button_pressed():
	if connection:
		$HTTPRequest.request("http://127.0.0.1:5000/get")

func move_to_point():

	var x = $"slider x".value
	var y = $"slider y".value
	var z = $"slider z".value
	var r = $"slider r".value
	print("aqui")
	_make_post_request("http://localhost:5000/add",{"x":x,"y":y,"z":z,"r":r},false)
	if connection :
		_make_get_request("http://localhost:5000/move_to",{"x":x,"y":y,"z":z,"r":r},true)


func _on_request_completed(_result, _response_code, _headers, body):
	
	var json = JSON.parse(body.get_string_from_utf8())
	if json.result["code"] == 3:
		$OptionButton._add_itens(json.result["message"])
	



	


func _on_CheckButton_toggled(button_pressed):
	connection =button_pressed
	if connection:
		$CheckButton/RichTextLabel.text =  "conectado ao dobot"
	else:
		$CheckButton/RichTextLabel.text =  "não conectado ao Dobot"
