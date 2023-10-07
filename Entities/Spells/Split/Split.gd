class_name Split
extends Spell


func _effect():
	var middle: Projectile = champion.projectile.instantiate()
	var left: Projectile = champion.projectile.instantiate()
	var right: Projectile = champion.projectile.instantiate()
	
	if champion.get_collision_layer_value(2):
		middle.set_collision_layer_value(4, true)
		left.set_collision_layer_value(4, true)
		right.set_collision_layer_value(4, true)
		
		middle.set_collision_mask_value(3, true)
		left.set_collision_mask_value(3, true)
		right.set_collision_mask_value(3, true)
	else:
		middle.set_collision_layer_value(5, true)
		left.set_collision_layer_value(5, true)
		right.set_collision_layer_value(5, true)
		
		middle.set_collision_mask_value(2, true)
		left.set_collision_mask_value(2, true)
		right.set_collision_mask_value(2, true)
		
	middle.colour = champion.colour
	left.colour = champion.colour
	right.colour = champion.colour
	
	middle.position = champion.position
	left.position = champion.position
	right.position = champion.position
	
	middle.damage = champion.strength * 5
	left.damage = champion.strength * 5
	right.damage = champion.strength * 5
	
	var middle_rotation = champion.position.direction_to(champion.target.position).angle() - PI / 12
	middle.rotation = middle_rotation
	
	var left_rotation = champion.position.direction_to(champion.target.position).angle() + PI / 12
	left.rotation = left_rotation
	
	var right_rotation = champion.position.direction_to(champion.target.position).angle()
	right.rotation = right_rotation
	
	get_tree().current_scene.add_child(middle)
	get_tree().current_scene.add_child(left)
	get_tree().current_scene.add_child(right)
