extends Control


func _on_train_pressed():
	pass # Replace with function body.


func _on_battle_pressed():
	pass # Replace with function body.


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Options/Options.tscn")


func _on_quit_pressed():
	get_tree().quit()
