extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pause_button_pressed():
	get_tree().paused = true
	$PauseMenu.visible = true
	$PauseButton.visible = false


func _on_exit_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)


func _on_continue_button_pressed():
	$PauseButton.visible = true
	$PauseMenu.visible = false
	get_tree().paused = false
