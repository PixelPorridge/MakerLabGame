extends Control

@export var request_node: HTTPRequest
@export var result_node: Label

var response := "..."


func _process(_delta):
	if request_node.get_http_client_status():
		response = "Scanning..."
		result_node.add_theme_color_override("font_color", Color.WHITE)
	
	result_node.text = response


func _on_http_request_completed(_result, response_code, _headers, _body):
	if response_code == 200:
		response = "Success!"
		result_node.add_theme_color_override("font_color", Color.GREEN)
	elif response_code == 408:
		response = "Timeout!"
		result_node.add_theme_color_override("font_color", Color.RED)


# === Champions ===

# Knight
func _on_knight_pressed():
	if not request_node.get_http_client_status():
		var data = ChampionData.get_defaults(ChampionData.KNIGHT)
		var json = JSON.stringify(data)

		request_node.request(ServerData.URL + "/set-champion", ServerData.HEADERS, ServerData.POST, json)


# Wizard
func _on_wizard_pressed():
	if not request_node.get_http_client_status():
		var data = ChampionData.get_defaults(ChampionData.WIZARD)
		var json = JSON.stringify(data)

		request_node.request(ServerData.URL + "/set-champion", ServerData.HEADERS, ServerData.POST, json)


# Rogue
func _on_rogue_pressed():
	if not request_node.get_http_client_status():
		var data = ChampionData.get_defaults(ChampionData.ROGUE)
		var json = JSON.stringify(data)

		request_node.request(ServerData.URL + "/set-champion", ServerData.HEADERS, ServerData.POST, json)


# Archer
func _on_archer_pressed():
	if not request_node.get_http_client_status():
		var data = ChampionData.get_defaults(ChampionData.ARCHER)
		var json = JSON.stringify(data)

		request_node.request(ServerData.URL + "/set-champion", ServerData.HEADERS, ServerData.POST, json)


# === Spells ===

# Berserk
func _on_berserk_pressed():
	if not request_node.get_http_client_status():
		var data = SpellData.get_defaults(SpellData.BERSERK)
		var json = JSON.stringify(data)

		request_node.request(ServerData.URL + "/set-spell", ServerData.HEADERS, ServerData.POST, json)


# Fireball
func _on_fireball_pressed():
	if not request_node.get_http_client_status():
		var data = SpellData.get_defaults(SpellData.FIREBALL)
		var json = JSON.stringify(data)

		request_node.request(ServerData.URL + "/set-spell", ServerData.HEADERS, ServerData.POST, json)


# Counter
func _on_counter_pressed():
	if not request_node.get_http_client_status():
		var data = SpellData.get_defaults(SpellData.COUNTER)
		var json = JSON.stringify(data)

		request_node.request(ServerData.URL + "/set-spell", ServerData.HEADERS, ServerData.POST, json)


# Split
func _on_split_pressed():
	if not request_node.get_http_client_status():
		var data = SpellData.get_defaults(SpellData.SPLIT)
		var json = JSON.stringify(data)

		request_node.request(ServerData.URL + "/set-spell", ServerData.HEADERS, ServerData.POST, json)


# === Misc ===

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/Menu.tscn")


func _on_read_id_pressed():
	if not request_node.get_http_client_status():
		request_node.request(ServerData.URL + "/read-id")


func _on_clear_database_pressed():
	if not request_node.get_http_client_status():
		request_node.request(ServerData.URL + "/clear-database")
