extends Node2D

var file_path = "res://zapis/bron_moje.csv"

func _on_button_button_down():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_button_2_button_down():
	get_tree().change_scene_to_file("res://Nowe/Sceny/Wyposażenie.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/ekwipunek.tscn")


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/sklep.tscn")


func _on_button_5_pressed() -> void:
	# Otwórz plik CSV w trybie odczytu
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		# Odczytaj cały plik
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		var lines = content.split("\n")
		file.close()  # Zamykamy plik po odczycie

		# Sprawdzenie, czy plik zawiera przynajmniej dwie linie
		if lines.size() >= 2:
			# Zostawiamy tylko pierwsze dwie linie
			var first_two_lines = lines[0] + "\n" + lines[1] + "\n"
			
			# Otwórz plik ponownie w trybie zapisu, nadpisując jego zawartość
			var file_write = FileAccess.open(file_path, FileAccess.WRITE)
			file_write.store_string(first_two_lines)
			file_write.close()

			print("Plik został zresetowany do dwóch linii.")
		else:
			print("Plik ma mniej niż dwie linie.")
	else:
		print("Nie można otworzyć pliku:", file_path)


func _on_button_6_pressed() -> void:
	get_tree().change_scene_to_file("res://Nowe/Sceny/arena2.tscn")
