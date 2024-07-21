extends Node2D
var wcisniento="nic"

func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	wcisniento=get_node("ItemList").get_item_text(index)
	match wcisniento:
		"Arena":
			get_tree().change_scene_to_file("res://arenav_2.tscn")
		"Tawerna":
			get_tree().change_scene_to_file("res://tawerna.tscn")
