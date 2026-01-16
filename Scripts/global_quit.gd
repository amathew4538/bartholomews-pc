extends CanvasLayer

@onready var qp = $quit_popup

func trigger_quit_dialog():
	qp.popup_centered()

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		qp.popup_centered()
		
func _on_quit_popup_confirmed() -> void:
	get_tree().quit(0)
