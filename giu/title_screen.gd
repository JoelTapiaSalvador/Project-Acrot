extends Node


func _on_start_button_pressed():
	Main.goto_scene("res://levels/room.tscn")


func _on_exit_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
