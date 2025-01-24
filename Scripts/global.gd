extends Node

var player_current_attack = false

var intermi = false

var cantWave = 5

var points = 0

var pointsLevel = 0

var generated_enemy = 0

var allItems = [
	"res://Nodos/Items/item.tscn",
	"res://Nodos/Items/item01.tscn",
	"res://Nodos/Items/item02.tscn",
	"res://Nodos/Items/item03.tscn",
	"res://Nodos/Items/item04.tscn",
	"res://Nodos/Items/item05.tscn",
	"res://Nodos/Items/item06.tscn",
	"res://Nodos/Items/item07.tscn",
	"res://Nodos/Items/item08.tscn",
]

func resetVar():
	pointsLevel = 0
	cantWave = 5
	points = 0
	generated_enemy = 0
