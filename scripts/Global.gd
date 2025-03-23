extends Node

var pit 
var avocado 
var pitspawn = 0

var avo_dir

func _ready():
	pit = false
	avocado = true

func pit_switch():
	if pit == false:
		pit = true
		avocado = false
	else:
		pit = false
		avocado = true

func get_avocado():
	return avocado

func get_pit():
	return pit
