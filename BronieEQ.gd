extends Node2D
var Posiadane=["miecz","Siekiera"]
func _ready() -> void:
	for i in Posiadane.size():
		$ItemList.add_item(Posiadane[i])
