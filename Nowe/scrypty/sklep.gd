extends Node2D

var file_path = "res://tabelki/bron_moje.csv"
var ile = 0
var ID = 1

func _on_button_pressed() -> void:
	# Otwieranie pliku w trybie zapisu z dodawaniem danych (READ_WRITE)
	var file = FileAccess.open(file_path, FileAccess.READ_WRITE)

	if file:
		# Przejście do końca pliku, aby dodać nową linię
		file.seek_end()
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		var lines = content.split(" ")
		for line in lines:
			ile += 1
		ID = ile + 1
		var new_data = [str(ID), "2"]
		# Tworzenie nowej linii jako string rozdzielony średnikiem
		var new_line = ";".join(new_data) + " "

		# Zapis nowej linii do pliku
		file.store_string(new_line)
		file.close()

		print("Nowa linia została dodana do pliku:", new_line)
	else:
		print("Nie można otworzyć pliku:", file_path)
