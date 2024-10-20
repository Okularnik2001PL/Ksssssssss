extends Node
var Magazyn = "res://zapis/bron_moje.csv"
var Dane = "res://tabelki/bron_statystki.csv"
var Ekwipunek = "res://zapis/EQ_gracz/bron_EQ_gracz.csv"

func znajdz(co,gdzie):
	if czytaj(gdzie)[0].strip_edges() == czytaj(co)[1].strip_edges():
		return gdzie[1]
func czytaj(co):
	# Tworzenie instancji klasy FileAccess
	var Otwarty = FileAccess.open(co, FileAccess.READ)
	if Otwarty:
		var Zawartość = Otwarty.get_buffer(Otwarty.get_length()).get_string_from_utf8()
		# Podział na linie
		return podziel_linie(Zawartość)
func podziel_linie(co):
	var Linie = co.split("\n")
	return podziel_komurki(Linie)
func podziel_komurki(co):
	for linia in co:
		if linia.strip_edges() == "": 
			continue  # Pomija pustą linię
		var komurki = linia.split(";")  # Zakładamy, że dane są rozdzielone średnikiem
		# Sprawdzamy, czy liczba kolumn jest większa niż 1, aby uniknąć błędów indeksowania
		if komurki.size() > 1 and komurki[0] != "ID":
			return komurki
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
		file.seek(0)
		# Zapisanie zmodyfikowanych danych do pliku
		file.store_string(new_content)
		# Zamykanie pliku
		file.close()
	
	get_tree().change_scene_to_file("res://Nowe/Sceny/Wyposażenie.tscn")
