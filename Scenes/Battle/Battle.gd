extends Node2D

const champions = {
	Champion.KNIGHT: preload("res://Entities/Champions/Knight/Knight.tscn"),
	Champion.WIZARD: preload("res://Entities/Champions/Wizard/Wizard.tscn"),
	Champion.ROGUE: preload("res://Entities/Champions/Rogue/Rogue.tscn"),
	Champion.ARCHER: preload("res://Entities/Champions/Archer/Archer.tscn")
}

@export var p1_health_bar : ProgressBar
@export var p2_health_bar : ProgressBar

@onready var p1 = champions[Player.p1_champion[Champion.CHAMPION]].instantiate()
@onready var p2 = champions[Player.p2_champion[Champion.CHAMPION]].instantiate()


func _ready():
	p1.set_data(Player.p1_champion)
	p2.set_data(Player.p2_champion)

	var viewport_size = get_viewport().content_scale_size
	p1.position = Vector2(150, viewport_size.y * 0.58)
	p2.position = Vector2(viewport_size.x - 150, viewport_size.y * 0.58)
	p2.sprite.flip_h = true

	p1.sprite.material.set_shader_parameter("line_color", Color(1, 0.302, 0.302))
	p2.sprite.material.set_shader_parameter("line_color", Color(0.302, 0.302, 1))

	add_child(p1)
	add_child(p2)

	p1_health_bar.max_value = p1.vitality
	p2_health_bar.max_value = p2.vitality


func _process(_delta):
	p1_health_bar.value = p1.health
	p2_health_bar.value = p2.health
