extends Area2D


func _ready() -> void:
	pass

func _on_coin_body_entered(body: Node) -> void:
	$AnimationPlayer.play("coinJump")
	body.add_coin()

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free()
