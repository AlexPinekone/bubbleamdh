extends CharacterBody2D

var bubble = preload("res://Nodos/bubble.tscn")

const SPEED = 140
var bubble_speed = 6
var bubble_time = 0.5

var input_direction: get = _get_input_direction
var sprite_direction= "Down": get = _get_sprite_direction

@onready var sprite = $AnimatedSprite2D	

func _physics_process(_delta):
	velocity = input_direction * SPEED
	
	if Input.is_action_just_pressed("blow"):
		blow()
	move_and_slide()
	
	set_animation("walk")
	if velocity == Vector2.ZERO:
		sprite.stop()
	
func set_animation(animation):
	var direction = "Side" if sprite_direction in ["Left", "Right"] else sprite_direction
	sprite.play(animation + direction)
	sprite.flip_h = (sprite_direction == "Left")

func _get_input_direction():
	var x = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	var y = -int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	input_direction = Vector2(x,y).normalized()
	return input_direction
	
func _get_sprite_direction():
	match input_direction:
		Vector2.LEFT:
			sprite_direction = "Left"
		Vector2.RIGHT:
			sprite_direction = "Right"
		Vector2.UP:
			sprite_direction = "Up"
		Vector2.DOWN:
			sprite_direction = "Down"
	return sprite_direction

func blow():
	#$AnimatedSprite.play("blow")
	
	var bubble_ins = bubble.instantiate()
	if sprite_direction == "Right":
		bubble_ins.speedX = bubble_speed * ((velocity.x / SPEED) if velocity.x != 0 || velocity.y !=0 else 1)
	else:
		bubble_ins.speedX = -bubble_speed * ((-velocity.x / SPEED) if velocity.x != 0 || velocity.y !=0 else 1)
		
	if sprite_direction == "Down":
		bubble_ins.speedY = bubble_speed * ((velocity.y / SPEED) if velocity.x != 0 || velocity.y !=0 else 1)
	else:
		bubble_ins.speedY = -bubble_speed * ((-velocity.y / SPEED) if velocity.x != 0 || velocity.y !=0 else 1)
		
	bubble_ins.time_on_air = bubble_time
	bubble_ins.position = position
	get_parent().add_child(bubble_ins)
