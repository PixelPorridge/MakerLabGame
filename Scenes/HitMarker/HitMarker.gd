class_name HitMarker
extends AnimatedSprite2D


func _ready():
	play()


func _physics_process(delta):
	rotation += 10 * delta
	if not is_playing():
		queue_free()
