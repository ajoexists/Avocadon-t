extends StaticBody2D

signal pressed
signal not_pressed

var press = false
var detect_is_monitoring = false
	
func _process(_delta):
	if press == false:
		$AnimatedSprite.animation = "Default"
	else:
		$AnimatedSprite.animation = "Pressed"
	
func _on_Detect_body_entered(body):
	if detect_is_monitoring == false:
		if press == false:
			if body.is_in_group("Pitstop Pete") or body.is_in_group("Obstacle"):
				emit_signal("pressed")
				press = true
			
func _on_Detect_body_exited(body):
	if detect_is_monitoring == false:
		if press == true:
			if body.is_in_group("Pitstop Pete") or body.is_in_group("Obstacle"):
				emit_signal("not_pressed")
				press = false

func pressed():
	detect_is_monitoring = true
	$AnimatedSprite.animation = "Pressed"
