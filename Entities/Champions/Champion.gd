extends CharacterBody2D

@export var sprite : Sprite2D
@export var animation : AnimationPlayer

@export var move_cooldown : Timer
@export var attack_cooldown : Timer

var target := CharacterBody2D

var strength : int
var defence : int
var speed : int
var dexterity : int
var vitality : int
var wisdom : int

var health : int

var rng = RandomNumberGenerator.new()
var direction := Vector2.ZERO

func _ready():
	rng.randomize()


func _physics_process(delta):

	if target.global_position.x > position.x:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

	animation.play("move")

	velocity = direction * speed * delta

	move_and_slide()


func set_data(data):
	strength = data[Champion.STRENGTH]
	defence = data[Champion.DEFENCE]

	speed = data[Champion.SPEED] * 5000
	animation.speed_scale = data[Champion.SPEED]

	dexterity = data[Champion.DEXTERITY]
	wisdom = data[Champion.WISDOM]

	vitality = data[Champion.VITALITY] * 10
	health = vitality


func _on_move_cooldown_timeout():
	direction.x = rng.randf_range(-1, 1)
	direction.y = rng.randf_range(-1, 1)
	direction = direction.normalized()


func _on_attack_cooldown_timeout():
	pass # Replace with function body.
