extends Area2D


func _ready() -> void:
	pass


func _on_coin_body_entered(body: Node) -> void:
	queue_free()
