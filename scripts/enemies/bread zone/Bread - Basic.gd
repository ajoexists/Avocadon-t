extends KinematicBody2D

var direction = Vector2.RIGHT
var velocity = Vector2.ZERO

onready var ledge_check_left = $LedgeLeft
onready var ledge_check_right = $LedgeRight
onready var wall_check_left = $WallLeft
onready var wall_check_right = $WallRight

func _ready():
	pass

func _physics_process(_delta):	
	var found_wall = wall_check_left.is_colliding() or wall_check_right.is_colliding()
	var found_ledge = not ledge_check_left.is_colliding() or not ledge_check_right.is_colliding()
	
	if found_ledge or found_wall:
		direction *= -1
	
	if velocity.x > 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	velocity = direction * 25
	move_and_slide(velocity, Vector2.UP)
	

func _on_Enemy_Detect_body_entered(body):
	if body.is_in_group("Pitstop Pete"):
		body.die()
