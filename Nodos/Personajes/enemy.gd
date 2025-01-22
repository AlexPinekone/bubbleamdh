extends CharacterBody2D

var SPEED = 70
var player_chase = false
var player: CharacterBody2D = null

var health = 60
var enemy_in_attack = false


func _physics_process(delta: float) -> void:
	if player_chase == true:
		position += (player.position - position).normalized() * SPEED * delta
		move_and_collide(Vector2(0,0)) 
		
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
			
		
func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player = body 
		player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player = null
		player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("bubble"):
		deal_damage()


func _on_enemy_hitbox_body_exited(body: Node2D) -> void:
	pass
		
func deal_damage():
	health -= player.damage
	if health <= 0:
		Global.points += 1
		Global.pointsLevel += 1
		self.queue_free()
