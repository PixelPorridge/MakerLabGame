class_name ChampionUpgrade
extends Control

@onready var request_node := $HTTPRequest

@export var strength_label: Label
@export var defence_label: Label
@export var speed_label: Label
@export var dexterity_label: Label
@export var vitality_label: Label
@export var wisdom_label: Label

@export var remove_strength: Button
@export var remove_defence: Button
@export var remove_speed: Button
@export var remove_dexterity: Button
@export var remove_vitality: Button
@export var remove_wisdom: Button

@export var add_strength: Button
@export var add_defence: Button
@export var add_speed: Button
@export var add_dexterity: Button
@export var add_vitality: Button
@export var add_wisdom: Button

var data


func _on_http_request_completed(_result, response_code, _headers, body):
	if response_code == 200:
		data = ServerData.parse(JSON.parse_string(body.get_string_from_utf8()))
		
		# === Player Data ===
		var champion = data[ChampionData.CHAMPION]
		var level = data[ChampionData.LEVEL]
		
		var strength = data[ChampionData.STRENGTH]
		var defence = data[ChampionData.DEFENCE]
		var speed = data[ChampionData.SPEED]
		var dexterity = data[ChampionData.DEXTERITY]
		var vitality = data[ChampionData.VITALITY]
		var wisdom = data[ChampionData.WISDOM]
		
		var total = strength \
				  + defence \
				  + speed \
				  + dexterity \
				  + vitality \
				  + wisdom
		
		# === Default Champion Data ===
		var default_strength = ChampionData.STATS[champion][ChampionData.STRENGTH]
		var default_defence = ChampionData.STATS[champion][ChampionData.DEFENCE]
		var default_speed = ChampionData.STATS[champion][ChampionData.SPEED]
		var default_dexterity = ChampionData.STATS[champion][ChampionData.DEXTERITY]
		var default_vitality = ChampionData.STATS[champion][ChampionData.VITALITY]
		var default_wisdom = ChampionData.STATS[champion][ChampionData.WISDOM]
		
		var default_total = default_strength \
						  + default_defence \
						  + default_speed \
						  + default_dexterity \
						  + default_vitality \
						  + default_wisdom
		
		# === Labels ===
		strength_label.text = str(strength)
		
		if strength != default_strength:
			strength_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			strength_label.add_theme_color_override("font_color", Color.WHITE)
		
		defence_label.text = str(defence)
		
		if defence != default_defence:
			defence_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			defence_label.add_theme_color_override("font_color", Color.WHITE)
		
		speed_label.text = str(speed)
		
		if speed != default_speed:
			speed_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			speed_label.add_theme_color_override("font_color", Color.WHITE)
		
		dexterity_label.text = str(dexterity)
		
		if dexterity != default_dexterity:
			dexterity_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			dexterity_label.add_theme_color_override("font_color", Color.WHITE)
		
		vitality_label.text = str(vitality)
		
		if vitality != default_vitality:
			vitality_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			vitality_label.add_theme_color_override("font_color", Color.WHITE)
		
		wisdom_label.text = str(wisdom)
		
		if wisdom != default_wisdom:
			wisdom_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			wisdom_label.add_theme_color_override("font_color", Color.WHITE)
		
		
		# === Remove Buttons ===
		remove_strength.disabled = strength == default_strength
		remove_defence.disabled = defence == default_defence
		remove_speed.disabled = speed == default_speed
		remove_dexterity.disabled = dexterity == default_dexterity
		remove_vitality.disabled = vitality == default_vitality
		remove_wisdom.disabled = wisdom == default_wisdom
		
		# === Add Buttons ===
		if total < default_total + level - 1:
			add_strength.disabled = false
			add_defence.disabled = false
			add_speed.disabled = false
			add_dexterity.disabled = false
			add_vitality.disabled = false
			add_wisdom.disabled = false
		else:
			add_strength.disabled = true
			add_defence.disabled = true
			add_speed.disabled = true
			add_dexterity.disabled = true
			add_vitality.disabled = true
			add_wisdom.disabled = true


# === Remove Buttons ===

# Strength
func _on_remove_strength_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.STRENGTH] -= 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Defence
func _on_remove_defence_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.DEFENCE] -= 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Speed
func _on_remove_speed_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.SPEED] -= 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Dexterity
func _on_remove_dexterity_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.DEXTERITY] -= 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Vitality
func _on_remove_vitality_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.VITALITY] -= 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Wisdom
func _on_remove_wisdom_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.WISDOM] -= 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# === Add Buttons ===

# Strength
func _on_add_strength_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.STRENGTH] += 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Defence
func _on_add_defence_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.DEFENCE] += 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Speed
func _on_add_speed_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.SPEED] += 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Dexterity
func _on_add_dexterity_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.DEXTERITY] += 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Vitality
func _on_add_vitality_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.VITALITY] += 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)


# Wisdom
func _on_add_wisdom_pressed():
	if not request_node.get_http_client_status():
		var json = data
		json[ChampionData.WISDOM] += 1
		json = JSON.stringify(json)
		
		request_node.request(ServerData.URL + "/update-champion", \
			ServerData.HEADERS, ServerData.POST, json)
