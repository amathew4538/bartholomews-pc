@tool
extends Control
class_name LevelIcon

@export var level_name: String = "0"
@export var next_level_up: LevelIcon
@export var next_level_down: LevelIcon
@export var next_level_left: LevelIcon
@export var next_level_right: LevelIcon
@export var level_packed: PackedScene:
	set(value):
		level_packed = value
		if level_packed:
			level = level_packed.resource_path

var level: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "Level " + str(level_name)
	if level_packed and level != "":
			level = level_packed.resource_path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		$Label.text = "Level " + str(level_name)
