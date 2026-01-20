extends Button

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		SceneTransitionAnimation.change_scene("res://Scenes/start_screen.tscn")

func _on_pressed() -> void:
	SceneTransitionAnimation.change_scene("res://Scenes/start_screen.tscn")
