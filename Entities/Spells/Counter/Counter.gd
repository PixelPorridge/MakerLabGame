class_name Counter
extends Spell

@onready var duration: Timer = $Duration
@onready var area: Area2D = $Area2D
@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D


func _ready():
	super._ready()
	
	if champion.get_collision_layer_value(2):
		area.set_collision_mask_value(5, true)
	else:
		area.set_collision_mask_value(4, true)


func _effect():
	collision.disabled = false
	
	duration.start()


func _on_duration_timeout():
	collision.disabled = true


func _on_area_entered(proj: Projectile):
	if champion.get_collision_layer_value(2):
		proj.set_collision_layer_value(5, false)
		proj.set_collision_mask_value(2, false)
		
		proj.set_collision_layer_value(4, true)
		proj.set_collision_mask_value(3, true)
	else:
		proj.set_collision_layer_value(4, false)
		proj.set_collision_mask_value(3, false)
		
		proj.set_collision_layer_value(5, true)
		proj.set_collision_mask_value(2, true)

	proj.colour = champion.colour
	proj.sprite.material.set_shader_parameter("line_color", proj.colour)
	proj.sprite.material = proj.sprite.material.duplicate()
	
	proj.position = champion.position
	proj.damage = champion.strength * 5
	
	var proj_rotation = champion.position.direction_to(champion.target.position).angle()
	proj.rotation = proj_rotation
	
	proj.timeout.start()
	proj.speed *= 1.5
