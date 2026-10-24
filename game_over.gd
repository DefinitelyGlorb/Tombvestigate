extends CanvasLayer

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://tutorial_room.tscn")
