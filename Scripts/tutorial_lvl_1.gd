extends Node2D

@onready var ap = $AnimationPlayer
@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.VAR.set_variable("W", char(0xE0D7))
	Dialogic.VAR.set_variable("A", char(0xE015))
	Dialogic.VAR.set_variable("S", char(0xE0B9))
	Dialogic.VAR.set_variable("D", char(0xE056))
	ap.play("Aiddle_fly")
	await get_tree().create_timer(ap.current_animation_length).timeout
	Dialogic.start("res://Dialogue/Tutlvl1.dtl")
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_started():
	player.can_move = false
	player.velocity = Vector2.ZERO

func _on_timeline_ended():
	ap.play_backwards("Aiddle_fly")
	player.can_move = true
	Dialogic.timeline_started.disconnect(_on_timeline_started)
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
