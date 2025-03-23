extends KinematicBody2D

export(int) var speed = 35
export(int) var gravity = 8
export(int) var fall_gravity = 4

var velocity = Vector2.ZERO

func _ready():
	pass 
	
func _physics_process(_delta):
	if is_on_floor():
		velocity.y = 0
	apply_gravity()
	if velocity.y > 5:
		velocity.y += fall_gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func apply_gravity():
	velocity.y += gravity

func _on_LeftDetect_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		velocity.x = speed


func _on_RightDetect_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		velocity.x = -speed


func _on_LeftDetect_body_exited(body):
	if body.is_in_group("Pitstop Pete"):
		velocity.x = 0


func _on_RightDetect_body_exited(body):
	if body.is_in_group("Pitstop Pete"):
		velocity.x = 0
