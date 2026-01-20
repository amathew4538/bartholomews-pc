extends Button

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		GlobalQuit.trigger_quit_dialog()

func _on_pressed() -> void:
	GlobalQuit.trigger_quit_dialog()
