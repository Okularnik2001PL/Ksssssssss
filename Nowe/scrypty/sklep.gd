extends Node2D

var file_path = "res://zapis/bron_moje.csv"
var ID = 1

func _on_button_pressed() -> void:
	# Otwieranie pliku w trybie zapisu z dodawaniem danych (READ_WRITE)
	var file = FileAccess.open(file_path, FileAccess.READ_WRITE)

	if file:
		# Przejście do końca pliku, aby dodać nową linię
		file.seek_end()
		# Odczytanie zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		# Podział zawartości na linie
		var lines = content.split("\n")

		# Wyznaczenie nowego ID na podstawie liczby wierszy
		ID = lines.size()

		# Tworzenie nowych danych jako string rozdzielony średnikiem
		var new_data = [str(ID), "2"]
		var new_line = ";".join(new_data) + "\n"  # Użycie nowej linii jako separatora między wierszami

		# Zapis nowej linii do pliku
		file.store_string(new_line)
		file.close()

		print("Nowa linia została dodana do pliku:", new_line)
	else:
		print("Nie można otworzyć pliku:", file_path)


func _on_button_2_pressed() -> void:
	# Otwieranie pliku w trybie zapisu z dodawaniem danych (READ_WRITE)
	var file = FileAccess.open(file_path, FileAccess.READ_WRITE)

	if file:
		# Przejście do końca pliku, aby dodać nową linię
		file.seek_end()
		# Odczytanie zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		# Podział zawartości na linie
		var lines = content.split("\n")

		# Wyznaczenie nowego ID na podstawie liczby wierszy
		ID = lines.size()

		# Tworzenie nowych danych jako string rozdzielony średnikiem
		var new_data = [str(ID), "3"]
		var new_line = ";".join(new_data) + "\n"  # Użycie nowej linii jako separatora między wierszami

		# Zapis nowej linii do pliku
		file.store_string(new_line)
		file.close()

		print("Nowa linia została dodana do pliku:", new_line)
	else:
		print("Nie można otworzyć pliku:", file_path)


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://główne_menu.tscn")
