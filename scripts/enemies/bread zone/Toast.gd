extends KinematicBody2D

export(int) var jump_height = -340
export(int) var gravity = 10
export(int) var fall_gravity = 5

var velocity = Vector2.ZERO

func _ready():
	pass

func _physics_process(_delta):
	apply_gravity()
	if velocity.y > 5:
		velocity.y += fall_gravity

	velocity = move_and_slide(velocity, Vector2.UP)

func apply_gravity():
	velocity.y += gravity

func _on_Detect_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		body.die()

func toast_shoot():
	velocity.y += jump_height

func _on_Timer_timeout():
	toast_shoot()
