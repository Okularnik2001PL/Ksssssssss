extends Node2D
#nowe Wary
var Defens=0
var cienżar=0
var DMG_MAX=1
var DMG_MIN=1
var Siła=0
var Zrenczmość=1
var Wielkość_Tarczy=0
var Hp_Tarczy=0
# Zmienne globalne
var gra = 1
# Statystyki gracza
var Prentkosc1 = 50
var Hp1 = 100
var Dmg1 = randi_range(2,5)
var tarcza = randi_range(1,2)
var wytrzymalosc_tarczy = 30  # Poprawna nazwa zmiennej

# Statystyki wroga
var prentkosc2 = 100
var hp2 = 100
var dmg_Broni2x = 0
var dmg_Broni2y = 0

func _ready() -> void:
	wczytaj("res://zapis/EQ_gracz/bron_EQ_gracz.csv")

func wczytaj(co):
	var file = FileAccess.open(co, FileAccess.READ)  # Użycie FileAccess
	if file:  # Sprawdź, czy plik istnieje
		while not file.eof_reached():
			var linia = file.get_line()
			var dane = linia.split(",")  # Zakładamy, że dane są rozdzielone przecinkami
			if dane.size() >= 6:  # Wczytywanie danych gracza
				Prentkosc1 = int(dane[0])
				Hp1 = int(dane[1])
				Dmg1 = int(dane[2])
				tarcza = int(dane[3])
				wytrzymalosc_tarczy = int(dane[4])
			if dane.size() >= 4:  # Wczytywanie danych wroga
				prentkosc2 = int(dane[5])
				hp2 = int(dane[6])
				dmg_Broni2x = int(dane[7])
				dmg_Broni2y = int(dane[8])
		file.close()

func _process(delta):
	if Prentkosc1 == 0:
		if gra == 1:
			walka("sword+tarcza")
			smierc()
			Prentkosc1 = 50
	if prentkosc2 == 0:
		if gra == 1:
			walka("Barbarzynca")
			smierc()
			prentkosc2 = 100
	prentkosc2 -= 1
	Prentkosc1 -= 1

func walka(kto):
	match kto:
		"sword+tarcza":
			Dmg1 = randi_range(2,5)
			hp2 -= Dmg1
			$Enemy/HP.text = "Dziki Wojownik " + str(hp2)
		"Barbarzynca":
			var dmg2 = randi_range(dmg_Broni2x, dmg_Broni2y)
			Hp1 -= dmg2
			$Gracz/HP.text = "Zbrojny " + str(Hp1)

func smierc():
	if Hp1 < 1:
		print("zginoł1")
		gra = 0
	if hp2 < 1:
		print("zginoł2")
		gra = 0
