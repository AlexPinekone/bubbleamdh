extends Node2D

@onready var enemyN = preload("res://Nodos/Personajes/enemy.tscn")
@onready var enemyM = preload("res://Nodos/Personajes/enemyMid.tscn")
@onready var enemyB = preload("res://Nodos/Personajes/enemyMid.tscn")
var cant_norm = 5
var cant_mid = 0
var cant_big = 0
var solo = true

func _ready() -> void:
	pass

func _on_timer_timeout() -> void:
	if (Global.generated_enemy%Global.cantWave != 0 || Global.generated_enemy == 0):
		generate_enemy()
		Global.generated_enemy += 1
		
func _process(delta: float) -> void:
	if solo:
		match Global.cantWave:
			5:
				pass
			6:
				solo = false
				$Timer.wait_time = 1.8
				cant_norm = 3
				cant_mid = Global.cantWave - cant_norm
			_:
				solo = false
				cant_norm = 3
				cant_mid = Global.cantWave - cant_norm
	
	if Global.cantWave == Global.generated_enemy:
		solo = true
func generate_enemy():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random = rng.randi_range(1,4)
	
	match random:
		1:
			position = Vector2(rng.randi_range(-330,330),230)
		2:
			position = Vector2(rng.randi_range(-330,330),-210)
		3:
			position = Vector2(330, rng.randi_range(-210,230))
		4:
			position = Vector2(-330, rng.randi_range(-210,230))
	
	if (cant_norm > 0):
		print(cant_norm)
		var ene = enemyN.instantiate()
		ene.position = position
		get_parent().get_node("EnemyHandler").add_child(ene)
		cant_norm -= 1
	else:
		if (cant_mid > 0):
			var ene = enemyM.instantiate()
			ene.position = position
			get_parent().get_node("EnemyHandler").add_child(ene)
			cant_mid -= 1
		else:
			if (cant_big > 0):
				var ene = enemyB.instantiate()
				ene.position = position
				get_parent().get_node("EnemyHandler").add_child(ene)
				cant_big -= 1
