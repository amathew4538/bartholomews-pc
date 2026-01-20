extends Control

@export var changelog_scene: PackedScene 
var active_changelog: Node = null  # Store the reference here

func _on_pressed() -> void:
	# If a changelog already exists and hasn't been deleted, stop here
	if is_instance_valid(active_changelog):
		return
		
	var instance = changelog_scene.instantiate()
	active_changelog = instance # Save the reference
	add_child(instance)
	
	var current_time = $"../AnimationPlayer".current_animation_position
	var instance_anim = instance.get_node("AnimationPlayer")
	
	instance_anim.play("changelog_move")
	instance_anim.seek(current_time, true)
