extends Control

@export var changelog_scene: PackedScene 

func _on_pressed() -> void:
	var instance = changelog_scene.instantiate()
	add_child(instance)
	
	# Get the current time position of the main menu's animation
	var current_time = $"../AnimationPlayer".current_animation_position
	
	# Tell the changelog animation to start at that exact same time
	var instance_anim = instance.get_node("AnimationPlayer")
	instance_anim.play("your_animation_name")
	instance_anim.seek(current_time, true)
