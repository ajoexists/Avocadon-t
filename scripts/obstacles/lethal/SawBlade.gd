extends Area2D

func _ready():
	pass 

func _on_Detect_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		body.die()
