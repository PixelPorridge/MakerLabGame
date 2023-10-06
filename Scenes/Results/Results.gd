extends Control

@export var winner_label: Label

@export var p1_champion_upgrade: ChampionUpgrade
@export var p2_champion_upgrade: ChampionUpgrade

@export var p1_champion_textures: Array[TextureRect]
@export var p2_champion_textures: Array[TextureRect]

var time: float = 0.0


func _ready():
	for texture in p1_champion_textures:
		texture.visible = false
	p1_champion_textures[PlayerData.p1_champion[ChampionData.CHAMPION]].visible = true
	
	for texture in p2_champion_textures:
		texture.visible = false
	p2_champion_textures[PlayerData.p2_champion[ChampionData.CHAMPION]].visible = true
		
	winner_label.text = "Player %s Wins!" % PlayerData.winner
	
	if PlayerData.winner == 1:
		PlayerData.p1_champion[ChampionData.EXPERIENCE] += 50
		PlayerData.p2_champion[ChampionData.EXPERIENCE] += 25
		winner_label.add_theme_color_override("font_color", PlayerData.p1_colour)
	elif PlayerData.winner == 2:
		PlayerData.p1_champion[ChampionData.EXPERIENCE] += 25
		PlayerData.p2_champion[ChampionData.EXPERIENCE] += 50
		winner_label.add_theme_color_override("font_color", PlayerData.p2_colour)
		
	var p1_level = PlayerData.p1_champion[ChampionData.LEVEL]
	var p1_experience = PlayerData.p1_champion[ChampionData.EXPERIENCE]
	if p1_experience >= ChampionData.EXP_REQ[p1_level]:
		PlayerData.p1_champion[ChampionData.LEVEL] += 1
	
	var p2_level = PlayerData.p2_champion[ChampionData.LEVEL]
	var p2_experience = PlayerData.p2_champion[ChampionData.EXPERIENCE]
	if p2_experience >= ChampionData.EXP_REQ[p2_level]:
		PlayerData.p2_champion[ChampionData.LEVEL] += 1
	
	var p1_json = JSON.stringify(PlayerData.p1_champion)
	p1_champion_upgrade.request_node.request(ServerData.URL + "/update-champion", ServerData.HEADERS, ServerData.POST, p1_json)
	
	var p2_json = JSON.stringify(PlayerData.p2_champion)
	p2_champion_upgrade.request_node.request(ServerData.URL + "/update-champion", ServerData.HEADERS, ServerData.POST, p2_json)

	PlayerData.reset()


func _process(delta):
	time += delta
	var new_scale = cos(time * 10) * 0.05 + 1
	
	winner_label.scale = Vector2(new_scale, new_scale)


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/Menu.tscn")


func _on_rematch_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/ScanTwo/ScanTwo.tscn")
