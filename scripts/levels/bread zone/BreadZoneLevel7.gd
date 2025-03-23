extends Node2D

const pitspawn = preload ("res://scenes/characters/Pit.tscn")

var b1_pressed 
var b2_pressed
var b3_pressed

var blocks_destroyed_1 = false
var blocks_destroyed_2 = false

func _on_PitstopPete_pit_spawn():
	pit_spawn()

func _process(_delta):
	if b1_pressed == true:
		if blocks_destroyed_1 == true:
			pass
		else:
			$Avoblock.block_destroy()
			$Avoblock2.block_destroy()
			blocks_destroyed_1 = true
			$Button.pressed()
			
	if b2_pressed == true and b3_pressed == true:
		if blocks_destroyed_2 == true:
			pass
		else:
			$Avoblock3.block_destroy()
			$Avoblock4.block_destroy()
			blocks_destroyed_2 = true
			$Button3.pressed()
			$Button2.pressed()
		
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/levels/Menu.tscn")

func pit_spawn():
	var pit = pitspawn.instance()
	var player_position = $PitstopPete.global_position
	if Global.avo_dir == true:
		var spawn_x = player_position.x + -15 
		var spawn_y = player_position.y + 0  
		pit.global_position = Vector2(spawn_x, spawn_y)
		add_child(pit)
	else:
		var spawn_x = player_position.x + 15 
		var spawn_y = player_position.y + 0  
		pit.global_position = Vector2(spawn_x, spawn_y)
		add_child(pit)

func _on_Button_pressed():
	b1_pressed = true

func _on_Button2_pressed():
	b2_pressed = true

func _on_Button2_not_pressed():
	if blocks_destroyed_2 == false:
		b2_pressed = false
	else:
		pass

func _on_Button3_pressed():
	b3_pressed = true

func _on_Button3_not_pressed():
	if blocks_destroyed_2 == false:
		b3_pressed = false
	else:
		pass



func _on_LevelProgressor_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		get_tree().change_scene("res://scenes/levels/bread zone/BreadZoneLevel8.tscn")
