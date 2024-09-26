extends Node

# Ścieżka do pliku CSV
var file_path = "res://bron_statystki.csv"

# Funkcja do wczytania danych z pliku CSV
func load_csv_data(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	var data = []

	if file:
		while not file.eof_reached():
			var line = file.get_line()
			var fields = line.split(";")
			data.append(fields)
		file.close()

	return data

# Funkcja do znalezienia maksymalnych obrażeń dla broni o ID = 3
func get_max_damage_for_id(id):
	var data = load_csv_data(file_path)
	for row in data:
		if row[0].to_int() == id:
			return row[2].to_int()
	return null

# Test funkcji
func _ready():
	var id = 2
	var max_damage = get_max_damage_for_id(id)
	if max_damage != null:
		print("Maksymalne obrażenia dla broni o ID =", id, "to", max_damage)
	else:
		print("Broń o ID =", id, "nie została znaleziona")
