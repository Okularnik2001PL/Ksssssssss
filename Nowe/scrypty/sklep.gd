extends Node2D

var file_path = "res://zapis/bron_moje.csv"
var ID = 1

func _on_button_pressed() -> void:
	# Otwieranie pliku w trybie zapisu z dodawaniem danych (READ_WRITE)
	var file = FileAccess.open(file_path, FileAccess.READ_WRITE)

	if file:
		# Odczytanie zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		# Podział zawartości na linie
		var lines = content.split("\n")

		# Wyznaczanie najwyższego ID w istniejących liniach
		var highest_id = 0
		
		for line in lines:
			# Pomijanie pustych linii
			if line.strip_edges() == "":
				continue
			
			var columns = line.split(";")
			# Sprawdzanie, czy pierwsza kolumna to ID
			if columns.size() > 0 and columns[0].is_valid_int():
				var current_id = int(columns[0])
				if current_id > highest_id:
					highest_id = current_id
		
		# Wyznaczenie nowego ID na podstawie najwyższego ID
		var new_id = highest_id + 1
		print("Nowe ID:", new_id)
		
		# Tworzenie nowych danych jako string rozdzielony średnikiem
		var new_data = [str(new_id), "2"]  # Zmienna "2" dla tego przykładu
		var new_line = ";".join(new_data) + "\n"  # Użycie nowej linii jako separatora między wierszami

		# Przejście do końca pliku, aby dodać nową linię
		file.seek_end()
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
		# Odczytanie zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		# Podział zawartości na linie
		var lines = content.split("\n")
		
		# Wyznaczanie najwyższego ID w istniejących liniach
		var highest_id = 0
		
		for line in lines:
			# Pomijanie pustych linii
			if line.strip_edges() == "":
				continue
			
			var columns = line.split(";")
			# Sprawdzanie, czy pierwsza kolumna to ID
			if columns.size() > 0 and columns[0].is_valid_int():
				var current_id = int(columns[0])
				if current_id > highest_id:
					highest_id = current_id
		
		# Wyznaczenie nowego ID na podstawie najwyższego ID
		var new_id = highest_id + 1
		print("Nowe ID:", new_id)
		
		# Tworzenie nowych danych jako string rozdzielony średnikiem
		var new_data = [str(new_id), "3"]
		var new_line = ";".join(new_data) + "\n"  # Użycie nowej linii jako separatora między wierszami

		# Przejście do końca pliku, aby dodać nową linię
		file.seek_end()
		# Zapis nowej linii do pliku
		file.store_string(new_line)
		file.close()

		print("Nowa linia została dodana do pliku:", new_line)
	else:
		print("Nie można otworzyć pliku:", file_path)



func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://główne_menu.tscn")
