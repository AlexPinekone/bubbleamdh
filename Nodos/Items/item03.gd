extends RigidBody2D

var nameI = "GanzoPurific"

func _on_take_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		get_parent().get_parent().get_node("ItemName").show_Name(nameI)
		Global.generated_enemy = 0
		Global.cantWave += 1
		
		body.SPEED = 70
		body.cadencia = 0.1
		self.queue_free()
