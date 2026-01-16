extends Button


func _on_pressed() -> void:
	GlobalQuit.trigger_quit_dialog()
