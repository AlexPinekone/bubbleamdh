extends RigidBody2D

var nameI = "MrFuerte\nSlow and Furious"

func _on_take_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		get_parent().get_parent().get_node("ItemName").show_Name(nameI)
		Global.generated_enemy = 0
		Global.cantWave += 1
		
		body.SPEED = body.SPEED - 60
		body.cadencia = 0.1
		
		self.queue_free()
