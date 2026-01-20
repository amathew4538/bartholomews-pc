@tool
extends Control

@export var world_index: int = 0
@export var level_select_scene: NodePath = "res://Scenes/level_select.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "World " + str(world_index)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		$Label.text = "World " + str(world_index)
