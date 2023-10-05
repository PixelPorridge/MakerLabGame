extends Control

@export var request_node: HTTPRequest
@export var fight_button: Button

@export var p1_label: Label
@export var p2_label: Label

@export var p1_scan_champion: Label
@export var p1_scan_spell: Label
@export var p2_scan_champion: Label
@export var p2_scan_spell: Label

@export var p1_champion_overview: ChampionOverview
@export var p1_spell_overview: SpellOverview
@export var p2_champion_overview: ChampionOverview
@export var p2_spell_overview: SpellOverview

const P1_CHAMPION_STAGE: int = 0
const P1_SPELL_STAGE: int = 1
const P2_CHAMPION_STAGE: int = 2
const P2_SPELL_STAGE: int = 3
const READY_STAGE: int = 4

var stage: int = 0
var time: float = 0.0


func _process(delta):
	time += delta

	var tag_scale = cos(time * 10) * 0.05 + 1

	p1_scan_champion.scale = Vector2(tag_scale, tag_scale)
	p1_scan_spell.scale = Vector2(tag_scale, tag_scale)

	p2_scan_champion.scale = Vector2(tag_scale, tag_scale)
	p2_scan_spell.scale = Vector2(tag_scale, tag_scale)

	if fight_button.disabled == false:
		fight_button.scale = Vector2(tag_scale, tag_scale)
	
	if stage == P1_CHAMPION_STAGE || stage == P1_SPELL_STAGE:
		p1_label.scale = Vector2(tag_scale, tag_scale)
	elif stage == P2_CHAMPION_STAGE || stage == P2_SPELL_STAGE:
		p2_label.scale = Vector2(tag_scale, tag_scale)

	if (not request_node.get_http_client_status()):
		match stage:
			P1_CHAMPION_STAGE:
				request_node.request(ServerData.URL + "/get-champion")
				p1_scan_champion.visible = true
			P1_SPELL_STAGE:
				request_node.request(ServerData.URL + "/get-spell")
				p1_scan_spell.visible = true
			P2_CHAMPION_STAGE:
				request_node.request(ServerData.URL + "/get-champion")
				p2_scan_champion.visible = true
			P2_SPELL_STAGE:
				request_node.request(ServerData.URL + "/get-spell")
				p2_scan_spell.visible = true
			READY_STAGE:
				fight_button.disabled = false


func _on_menu_pressed():
	PlayerData.p1_champion = ChampionData.get_defaults()
	PlayerData.p1_spell = SpellData.get_defaults()
	PlayerData.p2_champion = ChampionData.get_defaults()
	PlayerData.p2_spell = SpellData.get_defaults()

	get_tree().change_scene_to_file("res://Scenes/Menu/Menu.tscn")


func _on_fight_pressed():
	get_tree().change_scene_to_file("res://Scenes/Battle/Battle.tscn")


func _on_http_request_completed(_result, response_code, _headers, body):
	if response_code == 200:
		var data = ServerData.parse(JSON.parse_string(body.get_string_from_utf8()))
		var id = data[ServerData.TAG_ID]

		if id == PlayerData.p1_champion[ServerData.TAG_ID]:
			return
		elif id == PlayerData.p1_spell[ServerData.TAG_ID]:
			return
		elif id == PlayerData.p2_champion[ServerData.TAG_ID]:
			return
		elif id == PlayerData.p2_spell[ServerData.TAG_ID]:
			return

		match stage:
			P1_CHAMPION_STAGE:
				PlayerData.p1_champion = data
				p1_scan_champion.visible = false
				p1_champion_overview.data = data
				p1_champion_overview.visible = true
			P1_SPELL_STAGE:
				PlayerData.p1_spell = data
				p1_scan_spell.visible = false
				p1_spell_overview.data = data
				p1_spell_overview.visible = true
			P2_CHAMPION_STAGE:
				PlayerData.p2_champion = data
				p2_scan_champion.visible = false
				p2_champion_overview.data = data
				p2_champion_overview.visible = true
			P2_SPELL_STAGE:
				PlayerData.p2_spell = data
				p2_scan_spell.visible = false
				p2_spell_overview.data = data
				p2_spell_overview.visible = true
				
		stage += 1
