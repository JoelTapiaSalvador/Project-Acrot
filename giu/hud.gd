extends CanvasLayer

@onready var pause_button = $PauseButton
@onready var pause_menu = $PauseMenu


func _on_pause_button_pressed():
	# Pause the game.
	get_tree().paused = true
	# Show on HUD the Pause Menu.
	pause_menu.visible = true
	# Hide the Pause Button from the HUD.
	pause_button.visible = false


func _on_exit_button_pressed():
	# If the exit buttons is pressed propagate the close notification along all the tree.
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)


func _on_continue_button_pressed():
	#If the continue button is pressed show on HUD the Pause Button.
	pause_button.visible = true
	# Hide the Pause Menu from the HUD.
	pause_menu.visible = false
	# Unpause the game.
	get_tree().paused = false
