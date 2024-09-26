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

		# Iteracja przez linie i ich podział na kolumny (zakładamy, że dane są rozdzielone przecinkami)
		for line in lines:
			var columns = line.split(";")
			print(columns)  # Wyświetlenie danych z każdej kolumny

		# Zamknięcie pliku (FileAccess automatycznie zamyka plik po zakończeniu)
	else:
		print("Nie można otworzyć pliku:", file_path)
