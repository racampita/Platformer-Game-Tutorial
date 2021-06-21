extends KinematicBody2D

var velocity = Vector2.ZERO
var coins = 0

const SPEED = 500
const GRAVITY = 53
const JUMPFORCE =-1228
const FRICTION = 0.3

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	
	if not is_on_floor():
		$Sprite.play("air")
	
	velocity.y += GRAVITY
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		$SoundJump.play()
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,FRICTION)
		
func _on_fallzone_body_entered(body: Node) -> void:
	get_tree().change_scene("res://GameOver.tscn")
	
func bounce():
	velocity.y = JUMPFORCE * 0.9

func ouch(var posx):
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y = JUMPFORCE * 0.7 
	if position.x < posx:
		velocity.x = -800
	elif position.x > posx:
		velocity.x = 800
	Input.action_release("left")
	Input.action_release("right")
	$Timer.start()

func _on_Timer_timeout() -> void:
	get_tree().change_scene("res://GameOver.tscn")
