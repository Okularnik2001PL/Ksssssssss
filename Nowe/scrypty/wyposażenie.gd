extends Node2D
var file_path = "res://zapis/EQ_gracz/bron_EQ_gracz.csv"
var file_path2= "res://tabelki/bron_statystki.csv"
func _ready() -> void:
	# Otwieranie pliku w trybie zapisu z dodawaniem danych (READ_WRITE)
	var file = FileAccess.open(file_path, FileAccess.READ_WRITE)
	var file2 = FileAccess.open(file_path2, FileAccess.READ)
	if file && file2:
		# Odczytanie zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		var content2 = file2.get_buffer(file2.get_length()).get_string_from_utf8()
		# Podział zawartości na linie
		var lines = content.split("\n")
		var lines2 = content2.split("\n")
		for line in lines:
			var columns = line.split(";")
			if columns[0]==str(1):
				for line2 in lines2: 
					var columns2 = line2.split(";")
					if columns[0]!="EQ"&&columns.size() > 1:
						if columns2[0]!="ID":
							if columns2[0]==columns[1]:
								$"VBoxContainer/HBoxContainer/Ręka1".text=columns2[1]


func _on_głowa_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/hełmy.tscn")


func _on_ręka_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/bronie.tscn")


func _on_tors_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/zbroje.tscn")


func _on_ręka_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/tarcze.tscn")


func _on_nogi_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/spodnie.tscn")


func _on_stopy_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/buty.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://główne_menu.tscn")
