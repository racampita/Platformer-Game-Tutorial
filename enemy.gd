extends KinematicBody2D

var velocity = Vector2()
#direction : 1 -> right, -1 -> left
export var direction = -1
export var detects_cliffs = true

func _ready() -> void:
	if direction > 0:
		$AnimatedSprite.flip_h = true
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs

func _physics_process(delta: float) -> void:
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += 20
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)
