extends Node2D

var pause_menu = preload("res://pause_menu.tscn").instantiate()
var lose_menu = preload("res://game_over.tscn").instantiate()

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().root.add_child(pause_menu)
		get_tree().paused = true

func _on_player_health_depleted() -> void:
	get_tree().change_scene_to_node(lose_menu)
