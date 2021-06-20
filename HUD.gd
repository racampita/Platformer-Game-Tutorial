extends CanvasLayer

var coins = 0

func _ready() -> void:
	$Coins.text = String(coins)

func _on_coin_collected() -> void:
	coins += 1
	_ready()
	if coins >= 6:
		get_tree().change_scene("res://YouWin.tscn")

