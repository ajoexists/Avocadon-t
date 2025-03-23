extends KinematicBody2D

signal pit_spawn

export(int) var jump_height = -160
export(int) var jump_release = -60
export(int) var max_speed = 90
export(int) var acceleration = 40
export(int) var friciton = 15
export(int) var gravity = 8
export(int) var fall_gravity = 4
export(int) var trampoline = -250
 
var velocity = Vector2.ZERO
var double_jump = 1

var is_pit_spawned
var dead 

func _ready():
	is_pit_spawned = false
	dead = false

func _process(_delta):
	if Global.pitspawn == 1:
		if is_pit_spawned == false:
			emit_signal("pit_spawn")
			is_pit_spawned = true
	if dead == false:
		$AnimatedSprite.show()
		$CollisionShape2D.disabled = false
		if Global.avocado == true:
			if Input.is_action_just_released("pit_switch"):
				if Global.pitspawn == 0:
					Global.pitspawn = 1
				if $PeteTimer.is_stopped():
					$PeteTimer.start()
					Global.pit_switch()

func _physics_process(_delta):
	if dead == false:
		apply_gravity()
		if Global.avocado == true:
			$Camera2D.current = true
			var input = Vector2.ZERO
			input.x = Input.get_action_strength("pete_right") - Input.get_action_strength("pete_left")
			
			if input.x == 0:
				apply_friction()
				$AnimatedSprite.animation = "Idle"
			else:
				apply_acceleration(input.x)
				$AnimatedSprite.animation = "Run"
				if input.x <= 0:
					$AnimatedSprite.flip_h = true
					Global.avo_dir = true
				else:
					$AnimatedSprite.flip_h = false
					Global.avo_dir = false
			
			if is_on_floor():
				double_jump = 1 
				if Input.is_action_pressed("pete_jump"):
					velocity.y = jump_height
			else:
				$AnimatedSprite.animation = "Jump"
				if Input.is_action_just_released("pete_jump") and velocity.y < jump_release:
					velocity.y = jump_release
				if Input.is_action_just_pressed("pete_jump") and double_jump == 1:
					double_jump = 0
					velocity.y = 0
					$AnimatedSprite.animation = "Jump"
					velocity.y += jump_height

				if velocity.y > 5:
					$AnimatedSprite.animation = "Fall"
					velocity.y += fall_gravity
					
		else:
			apply_friction()
			$AnimatedSprite.animation = "Idle"
				
		velocity = move_and_slide(velocity, Vector2.UP)
	if dead == true:
		$AnimatedSprite.hide()
		$CollisionShape2D.disabled = true

func apply_gravity():
	velocity.y += gravity

func apply_friction():
	velocity.x = move_toward(velocity.x, 0, friciton)

func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, max_speed * amount, acceleration)

func die():
	dead = true
	$DeadParticle.emitting = true
	
func trampoline_boost():
	velocity.y = 0
	velocity.y += trampoline
