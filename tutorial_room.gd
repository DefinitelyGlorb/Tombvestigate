extends "res://platformer_game.gd"

func _on_win_zone_body_entered(_body: Node2D) -> void:
	$WinZone/WinJingle.play()
	$WinText.visible = true
	$Player/Music.stream_paused = true
	$WinZone/CollisionShape2D.set_deferred("disabled", true)

func _on_win_jingle_finished() -> void:
	$Player/Music.stream_paused = false

func _on_outof_bounds_body_entered(body: Node2D) -> void:
	body.position = Vector2(0, -50)
	$Player.take_damage()
