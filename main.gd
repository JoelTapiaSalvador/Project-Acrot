extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _notification(notification_content):
	if notification_content == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior


func _on_title_screen_start():
	pass # Replace with function body.
