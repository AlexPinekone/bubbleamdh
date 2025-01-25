extends RigidBody2D

var nameI = "Laisol\nDamage++"

func _on_take_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		get_parent().get_parent().get_node("ItemName").show_Name(nameI)
		Global.generated_enemy = 0
		Global.cantWave += 1
		Global.intermi = false
		
		body.damage += 30
		
		self.queue_free()
