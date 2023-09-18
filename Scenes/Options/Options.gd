extends Control


func _ready():
	$HTTPRequest.request_completed.connect(_on_scan_tag_request_completed)


func _on_scan_tag_pressed():
	$HTTPRequest.request(Global.SERVER + "/scan")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/Menu.tscn")


func _on_scan_tag_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	$MarginContainer/VBoxContainer/ScanTag.text = "SCAN TAG\n" + JSON.stringify(json)
