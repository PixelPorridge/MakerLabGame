extends CharacterBody2D

@onready var sprite := $Sprite
@onready var attack_cooldown := $AttackCooldown

@export var animation : AnimationPlayer

@export var BASE_STRENGTH : int
@export var BASE_DEFENCE : int
@export var BASE_SPEED : int
@export var BASE_DEXTERITY : int
@export var BASE_VITALITY : int
@export var BASE_WISDOM : int

var stats = Champion.get_defaults()

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

		velocity = direction * BASE_SPEED * stats[Champion.SPEED] * delta
	else:
		if not attacking:
			animation.play("idle")

		velocity = Vector2.ZERO

	move_and_slide()
