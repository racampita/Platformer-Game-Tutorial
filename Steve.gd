extends KinematicBody2D

var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		velocity.x = 100
	if Input.is_action_pressed("left"):
		velocity.x = -100
	
	move_and_slide(velocity)
	
	velocity.x = lerp(velocity.x,0,0.1)
