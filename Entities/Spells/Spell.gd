class_name Spell
extends Node2D

@onready var cooldown: Timer = $Cooldown

var champion: Champion

var rng = RandomNumberGenerator.new()


func _ready():
	_start_cooldown()


func _physics_process(_delta):
	position = champion.position


func _on_cooldown_timeout():
	_start_cooldown()
	_effect()


func _start_cooldown():
	var cooldown_time = rng.randf_range(7.5, 10)
	cooldown_time -= champion.wisdom * 0.25
	cooldown.start(cooldown_time)


func _effect():
	pass
