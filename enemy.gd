extends KinematicBody2D

var speed = 50
var velocity = Vector2()
#	direction : 1 -> right, -1 -> left
export var direction = -1
export var detects_cliffs = true

func _ready() -> void:
	if direction > 0:
		$AnimatedSprite.flip_h = true
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	if detects_cliffs:
		set_modulate(Color(1,.6,1))

func _physics_process(delta: float) -> void:
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += 20
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)


func _on_top_checker_body_entered(body: Node) -> void:
	$AnimatedSprite.play("squashed")
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$top_checker.set_collision_layer_bit(4,false)
	$top_checker.set_collision_mask_bit(0,false)
	$sides_checker.set_collision_layer_bit(4,false)
	$sides_checker.set_collision_mask_bit(0,false)
	$Timer.start()
	body.bounce()

func _on_sides_checker_body_entered(body: Node) -> void:
	body.ouch(position.x)


func _on_Timer_timeout() -> void:
	queue_free()
