extends Node2D
var Posiadane=["Portki"]
func _ready() -> void:
	for i in Posiadane.size():
		$ItemList.add_item(Posiadane[i])
