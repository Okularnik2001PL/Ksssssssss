extends Node2D

var Magazyn = "res://zapis/bron_moje.csv"
var Dane = "res://tabelki/bron_statystki.csv"
var Ekwipunek = "res://zapis/EQ_gracz/bron_EQ_gracz.csv"

func _ready() -> void:
	# Tworzenie instancji klasy FileAccess
	var Muj = FileAccess.open(Magazyn, FileAccess.READ)
	var Staty = FileAccess.open(Dane, FileAccess.READ)
	if Muj && Staty:
		# Odczytanie całej zawartości pliku
		var coM = Muj.get_buffer(Muj.get_length()).get_string_from_utf8()
		var coS = Staty.get_buffer(Staty.get_length()).get_string_from_utf8()
		# Podział na linie
		var lineM = coM.split("\n")
		var lineS = coS.split("\n")
		# Konwersja wierszy na tablicę tablic (gdzie każdy wiersz to osobna tablica)
		for linM in lineM:
			if linM.strip_edges() == "": 
				continue  # Pomija pustą linię
			var columns = linM.split(";")  # Zakładamy, że dane są rozdzielone średnikiem
			# Sprawdzamy, czy liczba kolumn jest większa niż 1, aby uniknąć błędów indeksowania
			if columns.size() > 1 and columns[0] != "ID":
				# Przeszukiwanie drugiego pliku CSV
				for linS in lineS:
					var columns2 = linS.split(";")  # Rozdzielamy linie w drugim pliku na kolumny
					# Sprawdzamy, czy w obu plikach ID się zgadza (kolumna 0 w obu plikach)
					if columns2[0].strip_edges() == columns[1].strip_edges():
						# Dodawanie przedmiotu do ItemList z drugiego pliku
						$ItemList.add_item(columns2[1])  # Zakładamy, że druga kolumna to nazwa przedmiotu

func _on_item_list_item_activated(index: int) -> void:
	var EQ = FileAccess.open(Ekwipunek, FileAccess.READ_WRITE)
	var Muj = FileAccess.open(Magazyn, FileAccess.READ)
	if EQ and Muj:
		# Odczytanie zawartości pliku
		var content = EQ.get_buffer(EQ.get_length()).get_string_from_utf8()
		var content2 = Muj.get_buffer(Muj.get_length()).get_string_from_utf8()
		var lines = content.split("\n")
		var lines2 = content2.split("\n")
		var new_content = ""
		
		# Modyfikacja odpowiednich danych
		if lines[0].strip_edges() == "":  # Pomija puste linie
			print("pusta")
		var columns = lines[0].split(";")
		print(columns)
		# Sprawdzamy, czy kolumny mają wystarczającą ilość elementów
		if columns.size() < 1:
			print("za mała")
			
			# Tworzenie zwykłej tablicy na podstawie PackedStringArray
		var columns_array = []
		for i in range(columns.size()):
			columns_array.append(columns[i])
			
		if columns_array[0] != "ID":  # Sprawdzenie, czy nie jest to nagłówek
			for line2 in lines2:
				var columns2 = line2.split(";")
					
					# Sprawdzamy, czy kolumny2 mają wystarczającą ilość elementów i odpowiedni typ
				if columns2.size() < 1||columns2[0]==""||columns2[0]=="ID":
					continue
					#obliczamy id przedmiotu
				var oblicz = index + 1
					#sukamy w skszynce
				if columns2[0] == str(oblicz):
					var dane_do = columns2[1]
					print(dane_do)
					columns_array[1] = str(dane_do)  # Modyfikowanie wartości w kolumnie 1
				
				# Odtwarzanie linii po modyfikacji
			new_content += ";".join(columns_array) + "\n"
		
		# Przechodzenie na początek pliku
		EQ.seek(0)
		# Zapisanie zmodyfikowanych danych do pliku
		EQ.store_string(new_content)
		# Zamykanie pliku
		EQ.close()
	
	get_tree().change_scene_to_file("res://Nowe/Sceny/Wyposażenie.tscn")
