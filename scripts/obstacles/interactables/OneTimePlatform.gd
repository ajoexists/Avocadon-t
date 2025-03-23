extends StaticBody2D

var detect 

func _ready():
	detect = false
	$AnimatedSprite.animation = "Default"


func _on_Detect_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		if detect == false:
			detect = true
			$AnimatedSprite.play("Break")
			$Timer.start()


func _on_Timer_timeout():
	queue_free()
