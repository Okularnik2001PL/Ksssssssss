extends Node2D
var gra=1
#sword+tarcza
var Prentkosc1=50
var Hp1=100
var Dmg1=randi_range(2,5)
var tarcza=randi_range(1,2)
var wytszymałosc_tarczy=30
#Axe
var prentkosc2=100
var hp2=100
var dmg_Broni2x=dane.znajdz(Ene.Barbarzynca[0],"dmg","x")
var dmg_Broni2y=dane.znajdz(Ene.Barbarzynca[0],"dmg","y")
func _process(delta):
	if Prentkosc1==0:
		if gra==1:
			walka("sword+tarcza")
			smierc()
			Prentkosc1=50
	if prentkosc2==0:
		if gra==1:
			walka("Barbarzynca")
			smierc()
			prentkosc2=100
	prentkosc2-=1
	Prentkosc1-=1
func walka(kto):
	match kto:
		"sword+tarcza":
			Dmg1=randi_range(2,5)
			#tarcza=randi_range(1,2)
			hp2-=Dmg1
			$Enemy/HP.text="Dziki Wojownik "+str(hp2)
			#print(tarcza)
		"Barbarzynca":
			var dmg2=randi_range(dmg_Broni2x,dmg_Broni2y)
			#if tarcza<2 && wytszymałosc_tarczy>0:
				#wytszymałosc_tarczy-=dmg2
				#$Label/Label.text="Tarcza "+str(wytszymałosc_tarczy)
			#else:
			Hp1-=dmg2
			$Gracz/HP.text="Zbrojny "+str(Hp1)
func smierc():
	if Hp1<1:
		print("zginoł1")
		gra=0
	if hp2<1:
		print("zginoł2")
		gra=0
