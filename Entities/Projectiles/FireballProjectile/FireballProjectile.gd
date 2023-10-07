class_name FireballProjectile
extends Projectile


func _ready():
	super._ready()
	timeout.start(3)
	speed = 600


func _ai(_delta):
	pass
