extends Node2D

var file_path = "res://zapis/bron_moje.csv"
var Dane = "res://tabelki/bron_statystki.csv"

func _ready() -> void:
	# Tworzenie instancji klasy FileAccess
	var file = FileAccess.open(file_path, FileAccess.READ)
	var file2 = FileAccess.open(Dane, FileAccess.READ)
	
	if file && file2:
		# Odczytanie całej zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		var content2 = file2.get_buffer(file2.get_length()).get_string_from_utf8()
		
		# Podział na linie
		var lines = content.split("\n")
		var lines2 = content2.split("\n")
		
		# Konwersja wierszy na tablicę tablic (gdzie każdy wiersz to osobna tablica)
		for line in lines:
			if line.strip_edges() == "": 
				print("przeskok") # Sprawdza, czy linia jest pusta
				continue  # Pomija pustą linię
			var columns = line.split(",")  # Zakładamy, że dane są rozdzielone średnikiem
			# Sprawdzamy, czy liczba kolumn jest większa niż 1, aby uniknąć błędów indeksowania
			if columns.size() > 1 and columns[0] != "ID":
				# Przeszukiwanie drugiego pliku CSV
				for line2 in lines2:
					var columns2 = line2.split(";")  # Rozdzielamy linie w drugim pliku na kolumny
					# Sprawdzamy, czy w obu plikach ID się zgadza (kolumna 0 w obu plikach)
					if columns2[0].strip_edges() == columns[1].strip_edges():
						# Dodawanie przedmiotu do ItemList z drugiego pliku
						$ItemList.add_item(columns2[1])  # Zakładamy, że druga kolumna to nazwa przedmiotu
					else:
						print("pierwszy")
						print(columns2[0])
						print(columns[1])
			else:
				print("drugi")
				print(columns.size())
				print(columns[0])
