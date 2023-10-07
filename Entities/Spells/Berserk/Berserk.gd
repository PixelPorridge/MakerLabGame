class_name Berserk
extends Spell

@onready var duration: Timer = $Duration


func _effect():
	champion.add_strength(1)
	champion.add_speed(1)
	champion.add_dexterity(1)
	
	duration.start()


func _on_duration_timeout():
	champion.remove_strength(1)
	champion.remove_speed(1)
	champion.remove_dexterity(1)
