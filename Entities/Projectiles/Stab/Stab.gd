class_name Stab
extends Projectile


func _ready():
	super._ready()
	timeout.start(0.75)
	speed = 500


func _ai(_delta):
	pass
