extends Node2D

var file_path = "res://zapis/tarcze_moje.csv"
var Dane = "res://tabelki/tarcze_statystki.csv"
var Ekwipunek = "res://zapis/EQ_gracz/tarcze_EQ_gracz.csv"

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
				continue  # Pomija pustą linię
			var columns = line.split(";")  # Zakładamy, że dane są rozdzielone średnikiem
			# Sprawdzamy, czy liczba kolumn jest większa niż 1, aby uniknąć błędów indeksowania
			if columns.size() > 1 and columns[0] != "ID":
				# Przeszukiwanie drugiego pliku CSV
				for line2 in lines2:
					var columns2 = line2.split(";")  # Rozdzielamy linie w drugim pliku na kolumny
					# Sprawdzamy, czy w obu plikach ID się zgadza (kolumna 0 w obu plikach)
					if columns2[0].strip_edges() == columns[1].strip_edges():
						# Dodawanie przedmiotu do ItemList z drugiego pliku
						$ItemList.add_item(columns2[1])  # Zakładamy, że druga kolumna to nazwa przedmiotu

func _on_item_list_item_activated(index: int) -> void:
	var file = FileAccess.open(Ekwipunek, FileAccess.READ_WRITE)
	var file2 = FileAccess.open(file_path, FileAccess.READ)
	if file and file2:
		# Odczytanie zawartości pliku
		var content = file.get_buffer(file.get_length()).get_string_from_utf8()
		var content2 = file2.get_buffer(file2.get_length()).get_string_from_utf8()
		var lines = content.split("\n")
		var lines2 = content2.split("\n")
		var new_content = ""
		
		# Zabezpieczenie przed pustymi liniami
		if lines.size() < 2 or lines[1].strip_edges() == "":
			print("Brak danych w drugim wierszu")
			return
		
		# Odczytanie drugiego wiersza (dane, które chcemy podmienić)
		var columns = lines[1].split(";")
		print("Odczytano dane:", columns)
		
		# Sprawdzamy, czy kolumny mają odpowiednią ilość elementów
		if columns.size() < 2:
			print("Za mało danych do podmiany")
			return
		
		# Konwersja do tablicy, aby łatwo modyfikować
		var columns_array = []
		for i in range(columns.size()):
			columns_array.append(columns[i])

		# Podmienianie danych na podstawie wybranego przedmiotu
		if columns_array[0] != "ID":  # Sprawdzenie, czy nie jest to nagłówek
			for line2 in lines2:
				var columns2 = line2.split(";")
				
				# Sprawdzamy, czy kolumny2 mają wystarczającą ilość elementów i odpowiedni typ
				if columns2.size() < 1 or columns2[0] == "" or columns2[0] == "ID":
					print("Pusta lub niepoprawna linia")
					continue
				
				# Obliczamy ID przedmiotu na podstawie indexu
				var oblicz = index + 1
				
				# Znajdujemy odpowiedni przedmiot w pliku
				if columns2[0] == str(oblicz):
					var dane_do = columns2[1]
					print("Znaleziono dane:", dane_do)
					
					# Modyfikowanie odpowiednich wartości w drugim wierszu
					columns_array[1] = str(dane_do)  # Podmienianie drugiej kolumny (nazwa przedmiotu)
					print("Zmieniono:", columns_array)

		# Odtwarzanie nagłówków i drugiego wiersza po modyfikacji
		new_content += lines[0] + "\n"  # Dodajemy nagłówki
		new_content += ";".join(columns_array) + "\n"  # Dodajemy zmodyfikowany wiersz
		
		# Przechodzenie na początek pliku
		file.seek(0)
		# Zapisanie zmodyfikowanych danych do pliku
		file.store_string(new_content)
		# Zamykanie pliku
		file.close()

	get_tree().change_scene_to_file("res://Nowe/Sceny/Wyposażenie.tscn")
