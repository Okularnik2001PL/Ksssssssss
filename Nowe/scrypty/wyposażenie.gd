extends Node2D
var file_path = "res://zapis/EQ_gracz/bron_EQ_gracz.csv"
var file_path2= "res://tabelki/bron_statystki.csv"
func _ready() -> void:
	wczytaj("res://tabelki/bron_statystki.csv","res://zapis/EQ_gracz/bron_EQ_gracz.csv",$"VBoxContainer/HBoxContainer/Ręka1")
	wczytaj("res://tabelki/buty_statystyki.csv","res://zapis/EQ_gracz/buty_EQ_moje.csv",$VBoxContainer/Stopy)
	wczytaj("res://tabelki/helmy_statystyki.csv","res://zapis/EQ_gracz/helmy_EQ_gracz.csv",$"VBoxContainer/Głowa")
	wczytaj("res://tabelki/spodnie_statystki.csv","res://zapis/EQ_gracz/spodnie_EQ_gracz.csv",$VBoxContainer/Nogi)
	wczytaj("res://tabelki/tarcze_statystki.csv","res://zapis/EQ_gracz/tarcze_EQ_gracz.csv",$"VBoxContainer/HBoxContainer/Ręka2")
	wczytaj("res://tabelki/zbroje_statystyki.csv","res://zapis/EQ_gracz/zbroje_EQ_gracz.csv",$VBoxContainer/HBoxContainer/Tors)
func wczytaj(dane,magazyn,do):
	# Otwieranie pliku w trybie zapisu z dodawaniem danych (READ_WRITE)
	var file = FileAccess.open(magazyn, FileAccess.READ_WRITE)
	var file2 = FileAccess.open(dane, FileAccess.READ)
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
								do.text=columns2[1]
								print(columns)
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
