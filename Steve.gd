extends KinematicBody2D

var velocity = Vector2.ZERO

const SPEED = 180
const GRAVITY = 60
const JUMPFORCE =-1100

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
	
	velocity.y += GRAVITY
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
