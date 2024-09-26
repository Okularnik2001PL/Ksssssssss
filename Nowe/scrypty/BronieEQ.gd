extends Node2D

var file_path = "res://tabelki/bron_statystki.csv"

func _ready() -> void:
	# Tworzenie instancji klasy FileAccess
	var file = FileAccess.open(file_path, FileAccess.READ)
	
	if file:
		# Odczytanie całej zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()

		# Podział na linie
		var lines = content.split("\n")

		# Konwersja wierszy na tablicę tablic (gdzie każdy wiersz to osobna tablica)
		for line in lines:
			var columns = line.split(";")  # Zakładamy, że dane są rozdzielone średnikiem

			# Sprawdzamy, czy liczba kolumn jest większa niż 1, aby uniknąć błędów indeksowania
			if columns.size() > 1:
				if columns[0]!="ID":
					# Dodawanie przedmiotów do ItemList (zakładam, że druga kolumna to nazwa przedmiotu)
					$ItemList.add_item(columns[1])
			else:
				print("Nieprawidłowy format danych w wierszu:", line)
	else:
		print("Nie można otworzyć pliku:", file_path)
