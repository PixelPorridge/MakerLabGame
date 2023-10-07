class_name Projectile
extends Area2D

@export var sprite: Sprite2D
@onready var timeout = $Timeout

@onready var hit_marker := preload("res://Scenes/HitMarker/HitMarker.tscn")

var colour: Color
var speed: int
var damage: int
var direction := Vector2.ZERO


func _ready():
	sprite.material.set_shader_parameter("line_color", colour)
	sprite.material = sprite.material.duplicate()


func _physics_process(delta):
	direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	_ai(delta)


func _ai(_delta):
	pass


func destroy():
	queue_free()


func _on_body_entered(champion: Champion):
	var actual_damage = damage - (champion.defence * 2)
	if actual_damage <= 0:
		actual_damage = 1
		
	champion.health -= actual_damage
	
	var hit_marker_inst = hit_marker.instantiate()
	hit_marker_inst.position = position
	get_tree().current_scene.add_child(hit_marker_inst)
	
	destroy()


func _on_area_entered(_area: Area2D):
	destroy()


func _on_timeout_timeout():
	destroy()
