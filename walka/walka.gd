extends Node2D

var Ekwipunek = "res://zapis/EQ_gracz/helmy_EQ_gracz.csv"
var WorekHelmy = "res://zapis/helmy_moje.csv"
var Dane = "res://tabelki/helmy_statystyki.csv"
var Pancerz = 0
var i = 0
var j = 0

func _ready() -> void:
	# Tworzenie instancji klasy FileAccess
	var file = FileAccess.open(Ekwipunek, FileAccess.READ)
	var file2 = FileAccess.open(WorekHelmy, FileAccess.READ)
	var file3 = FileAccess.open(Dane, FileAccess.READ)
	if file && file2 && file3:
				# Odczytanie całej zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		var content2 = file2.get_buffer(file2.get_length()).get_string_from_utf8()
		var content3 = file3.get_buffer(file3.get_length()).get_string_from_utf8()
		# Podział na linie
		var lines = content.split("\n")
		var lines2 = content2.split("\n")
		var lines3 = content3.split("\n")
		# Konwersja wierszy na tablicę tablic (gdzie każdy wiersz to osobna tablica)
		for line in lines:
			if line.strip_edges() == "": 
				continue  # Pomija pustą linię
			var columns = line.split(";")  # Zakładamy, że dane są rozdzielone średnikiem
			# Sprawdzamy, czy liczba kolumn jest większa niż 1, aby uniknąć błędów indeksowania
			if columns.size() > 1 and columns[0] != "ID":
				# Przeszukiwanie drugiego pliku CSV
				i = columns[1]
		#for przeszukujący worek z helmami
		for line in lines2:
			if line.strip_edges() == "": 
				continue  # Pomija pustą linię
			var columns = line.split(";")  # Zakładamy, że dane są rozdzielone średnikiem
			# Sprawdzamy, czy liczba kolumn jest większa niż 1, aby uniknąć błędów indeksowania
			if columns.size() > 1 and columns[0] != "ID":
				# Przeszukiwanie drugiego pliku CSV
				if columns[0] == i:
					j = columns[1]
		#for przeszukajcy statystyki
		for line in lines3:
			if line.strip_edges() == "": 
				continue  # Pomija pustą linię
			var columns = line.split(";")  # Zakładamy, że dane są rozdzielone średnikiem
			# Sprawdzamy, czy liczba kolumn jest większa niż 1, aby uniknąć błędów indeksowania
			if columns.size() > 1 and columns[0] != "ID":
				# Przeszukiwanie drugiego pliku CSV
				if columns[0] == j:
					Pancerz+=int(columns[2])
					
	print(Pancerz)
