extends Control


func _on_train_pressed():
	pass # Replace with function body.


func _on_battle_pressed():
	get_tree().change_scene_to_file("res://Scenes/ScanTwo/ScanTwo.tscn")


func _on_control_panel_pressed():
	get_tree().change_scene_to_file("res://Scenes/ControlPanel/ControlPanel.tscn")
