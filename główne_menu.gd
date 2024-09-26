extends Node2D


func _on_button_button_down():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_button_2_button_down():
	get_tree().change_scene_to_file("res://Nowe/Sceny/arena.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://ekwipunek.tscn")


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/sklep.tscn")
