extends Button

func _on_pressed() -> void:
	SceneTransitionAnimation.change_scene("res://Scenes/world_select.tscn")
