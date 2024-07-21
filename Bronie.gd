extends Node
# stały , przedział , efekt 
var Axe=[2,8,14]
var Sword=[2,2,5]



func przeszukaj(Co):
	match Co:
		"Axe":
			return(Axe)
		"Sword":
			return(Sword)
