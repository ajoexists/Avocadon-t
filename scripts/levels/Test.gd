extends Node2D

const pitspawn = preload ("res://scenes/characters/Pit.tscn")

func _ready():
	pass 

func _process(delta):
	if Global.pitspawn == 1:
		if $Pit == null:
			pit_spawn()

func pit_spawn():
	var pit = pitspawn.instance()
	pit.position = $PitstopPete/PitPosition.global_position
	add_child(pit)
