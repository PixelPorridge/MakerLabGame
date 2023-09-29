extends CharacterBody2D

@export var sprite : Sprite2D
@export var animation : AnimationPlayer
@export var attack_cooldown : Timer

var strength : int
var defence : int
var speed : int
var dexterity : int
var vitality : int
var wisdom : int

var health : int

var direction := Vector2.ZERO
var attacking := false

func _physics_process(delta):
	direction = Vector2.ZERO
	attacking = Input.get_action_strength("attack")

	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")

	direction = direction.normalized()

	if attacking:
		animation.play("attack")

	if direction != Vector2.ZERO:
		if not attacking:
			animation.play("move")
		
		if direction.x > 0:
			sprite.flip_h = false
		elif direction.x < 0:
			sprite.flip_h = true

		velocity = direction * speed * delta
	else:
		if not attacking:
			animation.play("idle")

		velocity = Vector2.ZERO

	move_and_slide()


func set_data(data):
	strength = data[Champion.STRENGTH]
	defence = data[Champion.DEFENCE]
	speed = data[Champion.SPEED] * 5000
	dexterity = data[Champion.DEXTERITY]
	vitality = data[Champion.VITALITY] * 10
	wisdom = data[Champion.WISDOM]
	health = vitality
