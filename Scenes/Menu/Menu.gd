extends Control

@export var title: TextureRect

var time: float = 0.0


func _physics_process(delta):
	time += delta

	var title_scale = cos(time * 10) * 0.05 + 1
	title.scale = Vector2(title_scale, title_scale)


func _on_battle_pressed():
	get_tree().change_scene_to_file("res://Scenes/ScanTwo/ScanTwo.tscn")


func _on_control_panel_pressed():
	get_tree().change_scene_to_file("res://Scenes/ControlPanel/ControlPanel.tscn")
