extends RigidBody2D
var Hp = 100
var Dmg = 1
var Def = 0
var tarcza = false
var enemy=null
func _physics_process(delta: float) -> void:
	$Label.text=str(Hp)
	if Hp<=0:
		queue_free()
	if enemy != null:
		velocity = (enemy.position - position).normalized()


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.hp-=Dmg
