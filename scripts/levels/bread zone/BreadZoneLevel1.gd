extends Node2D

const pitspawn = preload ("res://scenes/characters/Pit.tscn")

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/levels/Menu.tscn")

func _on_PitstopPete_pit_spawn():
	pit_spawn()

func pit_spawn():
	var pit = pitspawn.instance()
	var player_position = $PitstopPete.global_position
	if Global.avo_dir == true:
		var spawn_x = player_position.x + -335 
		var spawn_y = player_position.y + 0  
		pit.global_position = Vector2(spawn_x, spawn_y)
		add_child(pit)
	else:
		var spawn_x = player_position.x + -305 
		var spawn_y = player_position.y + 0  
		pit.global_position = Vector2(spawn_x, spawn_y)
		add_child(pit)

func _on_LevelProgressor_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel2.tscn")


