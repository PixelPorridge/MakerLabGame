extends Control

@export var request_node: HTTPRequest
@export var result_node: Label

const HEADERS = ["Content-Type: application/json"]
const POST = HTTPClient.METHOD_POST

var response := "..."


func _ready():
	request_node.request_completed.connect(_on_request_completed)

func _process(_delta):
	if request_node.get_http_client_status():
		response = "Scanning..."
		result_node.add_theme_color_override("font_color", Color.WHITE)
	
	result_node.text = response
			

func _on_request_completed(result, _response_code, _headers, body):
	if result == HTTPRequest.RESULT_SUCCESS:
		response = body.get_string_from_utf8()
		result_node.add_theme_color_override("font_color", Color.GREEN)

# === Champions ===

# Knight
func _on_knight_pressed():
	if not request_node.get_http_client_status():

		var data = Champion.get_defaults(Champion.KNIGHT)
		var json = JSON.stringify(data)

		request_node.request(Server.URL + "/set-champion", HEADERS, POST, json)

# Wizard
func _on_wizard_pressed():
	if not request_node.get_http_client_status():

		var data = Champion.get_defaults(Champion.WIZARD)
		var json = JSON.stringify(data)

		request_node.request(Server.URL + "/set-champion", HEADERS, POST, json)

# Rogue
func _on_rogue_pressed():
	if not request_node.get_http_client_status():

		var data = Champion.get_defaults(Champion.ROGUE)
		var json = JSON.stringify(data)

		request_node.request(Server.URL + "/set-champion", HEADERS, POST, json)

# Archer
func _on_archer_pressed():
	if not request_node.get_http_client_status():

		var data = Champion.get_defaults(Champion.ARCHER)
		var json = JSON.stringify(data)

		request_node.request(Server.URL + "/set-champion", HEADERS, POST, json)


# === Spells ===

# Berserk
func _on_berserk_pressed():
	if not request_node.get_http_client_status():

		var data = Spell.get_defaults(Spell.BERSERK)
		var json = JSON.stringify(data)

		request_node.request(Server.URL + "/set-spell", HEADERS, POST, json)

# Fireball
func _on_fireball_pressed():
	if not request_node.get_http_client_status():

		var data = Spell.get_defaults(Spell.FIREBALL)
		var json = JSON.stringify(data)

		request_node.request(Server.URL + "/set-spell", HEADERS, POST, json)

# Counter
func _on_counter_pressed():
	if not request_node.get_http_client_status():

		var data = Spell.get_defaults(Spell.COUNTER)
		var json = JSON.stringify(data)

		request_node.request(Server.URL + "/set-spell", HEADERS, POST, json)

# Split
func _on_split_pressed():
	if not request_node.get_http_client_status():

		var data = Spell.get_defaults(Spell.SPLIT)
		var json = JSON.stringify(data)

		request_node.request(Server.URL + "/set-spell", HEADERS, POST, json)


# === Misc ===

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/Menu.tscn")


func _on_read_id_pressed():
	if not request_node.get_http_client_status():
		request_node.request(Server.URL + "/read-id")


func _on_cancel_request_pressed():
	if request_node.get_http_client_status():
		request_node.cancel_request()
		response = "Request Cancelled!"
		result_node.add_theme_color_override("font_color", Color.RED)


func _on_clear_database_pressed():
	if not request_node.get_http_client_status():
		request_node.request(Server.URL + "/clear-database")
