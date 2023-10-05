class_name Arrow
extends Projectile


func _ready():
	super._ready()
	timeout.start(2)
	speed = 400


func _ai(_delta):
	pass
