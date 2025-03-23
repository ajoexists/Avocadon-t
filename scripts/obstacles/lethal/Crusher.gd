extends KinematicBody2D

export(int) var gravity = 30
export(int) var raise_gravity = -20

var velocity = Vector2.ZERO

func _ready():
	pass
	
func _physics_process(delta):
	if is_on_floor():
		velocity.y += raise_gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func apply_gravity():
	velocity.y += gravity

func _on_Timer_timeout():
	apply_gravity()


func _on_Detect_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		body.die()
