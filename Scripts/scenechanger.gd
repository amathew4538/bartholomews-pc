extends CanvasLayer

@onready var anim = $AnimationPlayer

func change_scene(target_path: String):
	anim.play("transition")
	await get_tree().create_timer(anim.current_animation_length / 2).timeout
	get_tree().change_scene_to_file(target_path)
	
