extends Node
#Ubrania
var Czabka=["Armor",1,"Masa",3]
#Bronie
var Axe=[8,14,20]

#rozdzielić broń i ubrania

func znajdz(Co,ile,o):
	match Co:
		"Axe":
			match o:
				"x":
					return(Axe[0])
				"y":
					return(Axe[1])
		"Czabka":
			return(Czabka)
