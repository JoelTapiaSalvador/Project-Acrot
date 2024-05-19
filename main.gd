extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _notification(notification_content):
	if notification_content == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior
