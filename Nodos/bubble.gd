extends RigidBody2D

var speedX: float = 0
var speedY: float = 0
var time_on_air: float
@onready var timer: Timer = $Timer
@onready var bloop = $bloop

func _ready() -> void:
	timer.stop()
	timer.wait_time = time_on_air
	timer.start()
	bloop.play()
	
func _physics_process(delta):
	global_position.y += speedY 
	global_position.x += speedX 
	
#func _on_body_entered(body: Node2D) -> void:
#	get_parent().call("check_win")
#	body.queue_free()
#	queue_free()


func _on_timer_timeout() -> void:
	queue_free()
	
func bubble():
	pass
