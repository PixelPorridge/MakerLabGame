class_name Champion
extends CharacterBody2D

@export var sprite: Sprite2D
@export var animation: AnimationPlayer

@export var move_cooldown: Timer
@export var attack_cooldown: Timer

var projectile: PackedScene

var target: CharacterBody2D
var colour: Color

var strength: int
var defence: int
var speed: int
var dexterity: int
var vitality: int
var wisdom: int

var max_health: int
var health: int

var rng := RandomNumberGenerator.new()
var direction := Vector2.ZERO


func _ready():
	rng.randomize()
	sprite.material.set_shader_parameter("line_color", colour)


func _physics_process(delta):
	animation.queue("move")
	
	if target.global_position.x > position.x:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

	velocity = direction * speed * 5000 * delta
	move_and_slide()


func set_data(data):
	strength = data[ChampionData.STRENGTH]
	
	defence = data[ChampionData.DEFENCE]

	speed = data[ChampionData.SPEED]

	dexterity = data[ChampionData.DEXTERITY]
	attack_cooldown.wait_time = 2.0 / dexterity

	vitality = data[ChampionData.VITALITY]
	max_health = vitality * 50
	health = max_health
	
	wisdom = data[ChampionData.WISDOM]


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
			proj.set_collision_mask_value(3, true)
		else:
			proj.set_collision_mask_value(2, true)
			
		proj.colour = colour
		proj.position = position
		proj.damage = strength * 10
		
		var proj_rotation = position.direction_to(target.position).angle()
		proj.rotation = proj_rotation
		
		get_tree().current_scene.add_child(proj)
