extends Node2D

var Posiadane = ["Miecz", "Siekiera"]
var file_path = "res://tabelki/bron_statystki.csv"

func _ready() -> void:
	# Dodawanie przedmiotów do ItemList
	for i in range(Posiadane.size()):
		$ItemList.add_item(Posiadane[i])
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

			# Sprawdzamy, czy nazwa w pierwszej kolumnie to "Miecz"
			if columns[0] == str(3):
				var damage = columns[3]  # Pobieramy wartość z drugiej kolumny (obrażenia)
				print("Obrażenia Miecza:", damage)  # Wyświetlamy obrażenia
				break  # Zatrzymujemy iterację, ponieważ znaleźliśmy potrzebne dane
	else:
		print("Nie można otworzyć pliku:", file_path)
