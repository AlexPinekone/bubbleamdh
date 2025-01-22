extends Node

var just_one = true

func _process(delta: float) -> void:
	if (Global.points % 10 == 0 and Global.points != 0 and just_one and Global.generated_enemy == Global.cantWave):
		just_one = false
		
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var ran1= rng.randi_range(0,Global.allItems.size()-1)
		var ran2= rng.randi_range(0,Global.allItems.size()-1)
		
		var item1 = load(Global.allItems[ran1])
		var item2 = load(Global.allItems[ran2])
		
		var ite1 = item1.instantiate()
		ite1.position = Vector2(180, 0)
		
		var ite2 = item1.instantiate()
		ite2.position = Vector2(-180, 0)
		
		add_child(ite1)
		add_child(ite2)
	else:
		if get_child_count() > 0 and Global.generated_enemy == 0:
			for child in get_children():
				child.queue_free()
			just_one = true
			
