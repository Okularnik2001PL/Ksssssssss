extends ItemList
var wcisniento="nic"
func _on_item_activated(index):
	wcisniento=get_item_text(index)
	match wcisniento:
		"Arena":
			get_tree().change_scene_to_file("res://node_2d.tscn")
		"Tawerna":
			get_tree().change_scene_to_file("res://tawerna.tscn")
