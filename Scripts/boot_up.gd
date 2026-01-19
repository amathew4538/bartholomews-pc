extends Control

@onready var audio = $AudioStreamPlayer2D

func _on_timer_timeout() -> void:
	audio.play()
	await audio.finished
	SceneTransitionAnimation.change_scene("res://Scenes/start_screen.tscn")
