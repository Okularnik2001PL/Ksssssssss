extends Node2D
var file_path = "res://tabelki/bron_moje.csv"
var ile=0
var ID=1
func _on_button_pressed() -> void:
	# Przygotowanie nowych danych do dodania
	var new_data = [ID, 1]
	
	# Otwieranie pliku w trybie zapisu z dodawaniem danych (WRITE_READ)
	var file = FileAccess.open(file_path, FileAccess.WRITE_READ)
	
	if file:
		# Przejście do końca pliku, aby dodać nową linię
		file.seek_end()
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		var lines = content.split("\n")
		for line in lines:
			ile+=1
			print(ile)
		# Tworzenie nowej linii jako string rozdzielony średnikiem
		var new_line = new_data.join(";") + "\n"

		# Zapis nowej linii do pliku
		file.store_string(new_line)
		file.close()

		print("Nowa linia została dodana do pliku:", new_line)
	else:
		print("Nie można otworzyć pliku:", file_path)
