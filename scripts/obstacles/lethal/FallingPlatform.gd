extends KinematicBody2D

export(int) var gravity = 8
export(int) var fall_gravity = 4

var fell 

var velocity = Vector2.ZERO

func _ready():
	fell = false
	$AnimatedSprite.play("Default")
	
func _physics_process(_delta):
	if velocity.y > 5:
		velocity.y += fall_gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func apply_gravity():
	velocity.y += gravity

func _on_Detect_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		body.die()


func _on_Timer_timeout():
	$AnimatedSprite.play("Default")
	apply_gravity()




func _on_PDetect_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		if fell == false:
			$Timer.start()
			$AnimatedSprite.play("Shake")
			fell = true

