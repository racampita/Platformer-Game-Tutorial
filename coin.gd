extends Area2D

signal coin_collected

func _ready() -> void:
	pass

func _on_coin_body_entered(body: Node) -> void:
	set_collision_mask_bit(0,false)
	$AnimationPlayer.play("coinJump")
	emit_signal("coin_collected")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free()
