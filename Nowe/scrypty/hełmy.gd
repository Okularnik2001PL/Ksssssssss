extends Node2D
var Posiadane=["Czabka","Hełm"]
func _ready() -> void:
	for i in Posiadane.size():
		$ItemList.add_item(Posiadane[i])
