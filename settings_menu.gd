extends CanvasLayer

func _on_back_button_pressed() -> void:
	if get_tree().root.get_child(0).name == "MainMenu":
		get_tree().paused = false
	get_tree().root.remove_child(self)
