extends CanvasLayer

var game = preload("res://tutorial_room.tscn").instantiate()
var settings_menu = preload("res://settings_menu.tscn").instantiate()

func _physics_process(_delta: float) -> void:
	if not %PlayButton.has_focus() and not %SettingsButton.has_focus() and not %QuitButton.has_focus():
		%PlayButton.grab_focus()

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_node(game)
	
func _on_settings_button_pressed() -> void:
	get_tree().root.add_child(settings_menu)
	get_tree().paused = true

func _on_quit_button_pressed() -> void:
	get_tree().quit()
