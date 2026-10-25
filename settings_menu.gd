extends CanvasLayer

func _enter_tree():
	InputMap.action_erase_events("pause")
		
func _on_back_button_pressed() -> void:
	if get_tree().root.get_child(0).name == "MainMenu":
		get_tree().paused = false
	var pause = InputEventKey.new()
	pause.physical_keycode = KEY_BACKSPACE
	InputMap.action_add_event("pause", pause)
	get_tree().root.remove_child(self)
	Settings.settings_open = false
	
