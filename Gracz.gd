extends Node
var Hp = 100
var Dmg = 1
var Def = 0
var tarcza = false
func _physics_process(delta: float) -> void:
	$Label.text=str(Hp)
	if Hp<=0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.hp-=Dmg
