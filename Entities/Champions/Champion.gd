class_name Champion
extends CharacterBody2D

@export var sprite: Sprite2D
@export var animation: AnimationPlayer

@export var move_cooldown: Timer
@export var attack_cooldown: Timer

var projectile: PackedScene

var target: CharacterBody2D
var colour: Color

var strength: int = 0
var defence: int = 0
var speed: int = 0
var dexterity: int = 0
var vitality: int = 0
var wisdom: int = 0

var max_health: int = 0
var health: int = 0

var rng := RandomNumberGenerator.new()
var direction := Vector2.ZERO


func _ready():
	rng.randomize()
	sprite.material.set_shader_parameter("line_color", colour)
	sprite.material = sprite.material.duplicate()


func _physics_process(delta):
	animation.queue("move")
	
	if target.global_position.x > position.x:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

	velocity = direction * speed / 2.0 * 5000 * delta
	move_and_slide()


func set_data(data):
	add_strength(data[ChampionData.STRENGTH])
	add_defence(data[ChampionData.DEFENCE])
	add_speed(data[ChampionData.SPEED])
	add_dexterity(data[ChampionData.DEXTERITY])
	add_vitality(data[ChampionData.VITALITY])
	add_wisdom(data[ChampionData.WISDOM])


func _on_move_cooldown_timeout():
	direction.x = rng.randf_range(-1, 1)
	direction.y = rng.randf_range(-1, 1)
	direction = direction.normalized()


func _on_attack_cooldown_timeout():
	var attack = rng.randi_range(0, 4)
	
	if (attack):
		animation.play("attack", -1, 2)
		
		var proj: Projectile = projectile.instantiate()
		
		if get_collision_layer_value(2):
			proj.set_collision_layer_value(4, true)
			proj.set_collision_mask_value(3, true)
		else:
			proj.set_collision_layer_value(5, true)
			proj.set_collision_mask_value(2, true)
			
		proj.colour = colour
		proj.position = position
		proj.damage = strength * 5
		
		var proj_rotation = position.direction_to(target.position).angle()
		proj.rotation = proj_rotation
		
		get_tree().current_scene.add_child(proj)


# === Add Stats ===
func add_strength(value):
	strength += value


func add_defence(value):
	defence += value


func add_speed(value):
	speed += value


func add_dexterity(value):
	dexterity += value
	attack_cooldown.wait_time = 1.5 - dexterity * 0.1


func add_vitality(value):
	vitality += value
	max_health += value * 50
	health += value * 50


func add_wisdom(value):
	wisdom += value


# === Remove Stats ===
func remove_strength(value):
	strength -= value


func remove_defence(value):
	defence -= value


func remove_speed(value):
	speed -= value


func remove_dexterity(value):
	dexterity -= value
	attack_cooldown.wait_time = 1.5 - dexterity * 0.1


func remove_vitality(value):
	vitality -= value
	max_health -= value * 50
	if health > max_health:
		health = max_health


func remove_wisdom(value):
	wisdom -= value
