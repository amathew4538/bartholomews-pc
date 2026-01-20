extends Control

@onready var worlds: Array = [$WorldIcon, $WorldIcon2, $WorldIcon3, $WorldIcon4, $WorldIcon5]
@onready var pi = $PlayerIcon

var current_world: int = 0
var move_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerIcon.global_position = worlds[current_world].global_position

func _input(event: InputEvent) -> void:
	if move_tween and move_tween.is_running():
		return
		
	if event.is_action_pressed("ui_left") and current_world > 0:
		current_world -= 1
		tween_icon()
		
	if event.is_action_pressed("ui_right") and current_world < worlds.size() - 1:
		current_world += 1
		tween_icon()
		
	if event.is_action_pressed("ui_accept"):
		if worlds[current_world].level_select_scene:
			SceneTransitionAnimation	.change_scene(worlds[current_world].level_select_scene)
			
func tween_icon():
	move_tween = get_tree().create_tween()
	move_tween.tween_property(pi, "global_position", worlds[current_world].global_position, 0.5).set_trans(Tween.TRANS_SINE)
