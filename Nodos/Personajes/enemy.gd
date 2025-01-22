extends CharacterBody2D

var SPEED = 70
var player_chase = false
var player: CharacterBody2D = null


func _physics_process(delta: float) -> void:
	if player_chase == true:
		position += (player.position - position).normalized() * SPEED * delta
		move_and_collide(Vector2(0,0)) 
		
func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
