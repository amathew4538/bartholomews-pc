extends Control
class_name LevelSelect

@onready var current_level: LevelIcon = $LevelIcon
@onready var pi = $PlayerIcon

var move_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerIcon.global_position = current_level.global_position

func _input(event: InputEvent) -> void:
	if move_tween and move_tween.is_running():
		return
	
	if event.is_action_pressed("ui_left") and current_level.next_level_left:
		current_level = current_level.next_level_left
		tween_icon()
		
	if event.is_action_pressed("ui_right") and current_level.next_level_right:
		current_level = current_level.next_level_right
		tween_icon()
		
	if event.is_action_pressed("ui_up") and current_level.next_level_upt:
		current_level = current_level.next_level_up
		tween_icon()
		
	if event.is_action_pressed("ui_down") and current_level.next_level_down:
		current_level = current_level.next_level_down
		tween_icon()
	if event.is_action_pressed("ui_accept") and current_level.level:
		SceneTransitionAnimation.change_scene(current_level.level)

func tween_icon():
	move_tween = get_tree().create_tween()
	move_tween.tween_property(pi, "global_position", current_level.global_position, 0.5).set_trans(Tween.TRANS_SINE)
