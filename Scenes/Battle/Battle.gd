extends Node2D

const champions = {
	ChampionData.KNIGHT: preload("res://Entities/Champions/Knight/Knight.tscn"),
	ChampionData.WIZARD: preload("res://Entities/Champions/Wizard/Wizard.tscn"),
	ChampionData.ROGUE: preload("res://Entities/Champions/Rogue/Rogue.tscn"),
	ChampionData.ARCHER: preload("res://Entities/Champions/Archer/Archer.tscn")
}

@export var p1_health_bar: ProgressBar
@export var p2_health_bar: ProgressBar

@export var p1_health_label: Label
@export var p2_health_label: Label

@onready var p1: Champion = champions[PlayerData.p1_champion[ChampionData.CHAMPION]].instantiate()
@onready var p2: Champion = champions[PlayerData.p2_champion[ChampionData.CHAMPION]].instantiate()


func _ready():
	p1.set_data(PlayerData.p1_champion)
	p2.set_data(PlayerData.p2_champion)
	
	p1.set_collision_layer_value(2, true)
	p2.set_collision_layer_value(3, true)

	p1.target = p2
	p2.target = p1
	
	p1.colour = PlayerData.p1_colour
	p2.colour = PlayerData.p2_colour

	var viewport_size = get_viewport().content_scale_size
	p1.position = Vector2(150, viewport_size.y * 0.58)
	p2.position = Vector2(viewport_size.x - 150, viewport_size.y * 0.58)
	p2.sprite.flip_h = true

	add_child(p1)
	add_child(p2)

	p1_health_bar.max_value = p1.health
	p2_health_bar.max_value = p2.health


func _physics_process(_delta):
	var p1_health = clamp(p1.health, 0, INF)
	var p2_health = clamp(p2.health, 0, INF)
	
	p1_health_bar.value = p1_health
	p2_health_bar.value = p2_health
	
	p1_health_label.text = "%s/%s" % [p1_health, p1.max_health]
	p2_health_label.text = "%s/%s" % [p2_health, p2.max_health]
	
	if p1_health == 0:
		PlayerData.winner_champion = PlayerData.p2_champion
		PlayerData.loser_champion = PlayerData.p1_champion
		PlayerData.winner = 2
		PlayerData.loser = 1
		get_tree().change_scene_to_file("res://Scenes/Results/Results.tscn")
	elif p2_health == 0:
		PlayerData.winner_champion = PlayerData.p1_champion
		PlayerData.loser_champion = PlayerData.p2_champion
		PlayerData.winner = 1
		PlayerData.loser = 2
		get_tree().change_scene_to_file("res://Scenes/Results/Results.tscn")
