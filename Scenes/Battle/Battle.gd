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
	
	p1.colour = Color(1, 0.302, 0.302)
	p2.colour = Color(0.302, 0.302, 1)

	var viewport_size = get_viewport().content_scale_size
	p1.position = Vector2(150, viewport_size.y * 0.58)
	p2.position = Vector2(viewport_size.x - 150, viewport_size.y * 0.58)
	p2.sprite.flip_h = true

	add_child(p1)
	add_child(p2)

	p1_health_bar.max_value = p1.health
	p2_health_bar.max_value = p2.health


func _physics_process(_delta):
	p1_health_bar.value = p1.health
	p2_health_bar.value = p2.health
	
	p1_health_label.text = "%s/%s" % [p1.health, p1.max_health]
	p2_health_label.text = "%s/%s" % [p2.health, p2.max_health]
