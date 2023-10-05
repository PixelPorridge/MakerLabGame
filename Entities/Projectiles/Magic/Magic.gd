class_name Magic
extends Projectile


func _ready():
	super._ready()
	timeout.start(2.5)
	speed = 250


func _ai(delta):
	if direction.x < 0:
		sprite.rotation -= 4 * delta
	else:
		sprite.rotation += 4 * delta
