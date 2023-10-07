class_name Fireball
extends Spell

@onready var projectile = preload("res://Entities/Projectiles/FireballProjectile/FireballProjectile.tscn")


func _effect():
	var proj: Projectile = projectile.instantiate()
	
	if champion.get_collision_layer_value(2):
		proj.set_collision_layer_value(4, true)
		proj.set_collision_mask_value(3, true)
	else:
		proj.set_collision_layer_value(5, true)
		proj.set_collision_mask_value(2, true)
		
	proj.colour = champion.colour
	proj.position = champion.position
	proj.damage = champion.strength * 10
	
	var proj_rotation = champion.position.direction_to(champion.target.position).angle()
	proj.rotation = proj_rotation
	
	get_tree().current_scene.add_child(proj)
