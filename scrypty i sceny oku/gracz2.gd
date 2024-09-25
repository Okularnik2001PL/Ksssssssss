extends RigidBody2D
var Hp = 100
var Dmg = 1
var Def = 0
var tarcza = false
@onready var enemy=get_parent().ememy
func _physics_process(delta: float) -> void:
	$Label.text=str(Hp)
	if Hp<=0:
		queue_free()
		print("zginołem")
	if enemy != null:
		linear_velocity = ((enemy.global_position - global_position)*10000).normalized()
	else:
		enemy=get_parent().ememy


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.hp-=Dmg
