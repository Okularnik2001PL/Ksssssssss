extends Node2D
var file_path = "res://zapis/EQ_gracz/bron_EQ_gracz.csv"
var file_path2= "res://tabelki/bron_statystki.csv"
func _ready() -> void:
	wczytaj("res://zapis/EQ_gracz/bron_EQ_gracz.csv","res://tabelki/bron_statystki.csv","res://zapis/bron_moje.csv",$"VBoxContainer/HBoxContainer/Ręka1")
	wczytaj("res://zapis/EQ_gracz/buty_EQ_moje.csv","res://tabelki/buty_statystyki.csv","res://zapis/buty_moje.csv",$VBoxContainer/Stopy)
	wczytaj("res://zapis/EQ_gracz/helmy_EQ_gracz.csv","res://tabelki/helmy_statystyki.csv","res://zapis/helmy_moje.csv",$"VBoxContainer/Głowa")
	wczytaj("res://zapis/EQ_gracz/spodnie_EQ_gracz.csv","res://tabelki/spodnie_statystki.csv","res://zapis/spodnie_moje.csv",$VBoxContainer/Nogi)
	wczytaj("res://zapis/EQ_gracz/tarcze_EQ_gracz.csv","res://tabelki/tarcze_statystki.csv","res://zapis/tarcze_moje.csv",$"VBoxContainer/HBoxContainer/Ręka2")
	wczytaj("res://zapis/EQ_gracz/zbroje_EQ_gracz.csv","res://tabelki/zbroje_statystyki.csv","res://zapis/zbroje_moje.csv",$VBoxContainer/HBoxContainer/Tors)
func wczytaj(eq,dane,magazyn,do):
	# Otwieranie pliku w trybie zapisu z dodawaniem danych (READ_WRITE)
	var file = FileAccess.open(magazyn, FileAccess.READ_WRITE)
	var file2 = FileAccess.open(dane, FileAccess.READ)
	var file3 = FileAccess.open(eq, FileAccess.READ)
	if file && file2 && file3:
		# Odczytanie zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		var content2 = file2.get_buffer(file2.get_length()).get_string_from_utf8()
		var content3 = file3.get_buffer(file3.get_length()).get_string_from_utf8()
		# Podział zawartości na linie
		var lines = content.split("\n")
		var lines2 = content2.split("\n")
		var lines3 = content3.split("\n")
		for line in lines:
			var colums=line.split(";")
			if colums.size()>1 && colums[0]!="ID":
				for line3 in lines3:
					var colums3=line3.split(";")
					if colums3[0]!="ID" && colums3.size()>1:
						if colums[0]==colums3[1]:
							for line2 in lines2:
								var colums2=line2.split(";")
								if colums[1]==colums2[0]:
									do.text=str(colums2[1])
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
