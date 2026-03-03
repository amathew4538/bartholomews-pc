extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		SceneTransitionAnimation.change_scene("res://Scenes/tutorial_lvl_1.tscn")
	else:
		body.queue_free()
