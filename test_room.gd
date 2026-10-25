extends "res://platformer_game.gd"

func _on_outof_bounds_body_entered(body: Node2D) -> void:
	body.position = Vector2(0, -50)
	$Player.take_damage()
