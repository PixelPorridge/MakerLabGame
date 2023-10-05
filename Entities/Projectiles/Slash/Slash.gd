class_name Slash
extends Projectile


func _ready():
	super._ready()
	timeout.start(2)
	speed = 100


func _ai(_delta):
	pass
