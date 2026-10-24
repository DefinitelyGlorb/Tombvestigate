extends CanvasLayer

var settings_menu = preload("res://settings_menu.tscn").instantiate()

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_parent().get_tree().paused = false
		get_tree().root.remove_child(self)

func _on_settings_button_pressed() -> void:
	get_tree().root.add_child(settings_menu)
	get_tree().paused = true

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	get_parent().get_tree().paused = false
	get_tree().root.remove_child(self)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
