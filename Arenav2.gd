extends Node2D
var spowolnienie=60
var garcz=[100]
var Przeciwnik=[]
# HP , Dmg , Armor , Tarcza
var HPGracz=100
var HPEnemy=100
func _ready():
	Przeciwnik.append(Enemy.Barbarzynca[0])
	Przeciwnik.append(Bronie.przeszukaj(Enemy.Barbarzynca[1])[0])
	Przeciwnik.append(Bronie.przeszukaj(Enemy.Barbarzynca[1])[1])
	Przeciwnik.append(Bronie.przeszukaj(Enemy.Barbarzynca[1])[2])
func _process(delta):
	if spowolnienie>0:
		spowolnienie-=1
	else:
		walka()
		smierc()
		spowolnienie=60
func walka():
	var dmg2=randi_range(Przeciwnik[2],Przeciwnik[3])
	HPGracz-=dmg2
	$Label.text=str(HPGracz)
func smierc():
	if HPGracz<1:
		print("zginoł1")

