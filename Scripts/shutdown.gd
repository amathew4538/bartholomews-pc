extends Control

@onready var audio = $AudioStreamPlayer2D
@onready var anim = $AnimationPlayer

func _on_timer_timeout() -> void:
	audio.play()
	await audio.finished
	anim.play("Shutdown")
	await get_tree().create_timer(anim.current_animation_length + 0.25).timeout
	get_tree().quit(0)
