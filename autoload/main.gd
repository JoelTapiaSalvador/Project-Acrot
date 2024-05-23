extends Node

# Preload HUD
@onready var hud = preload("res://giu/hud.tscn").instantiate()


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().auto_accept_quit = false


func _notification(notification_content):
	# If it recives the close request, quits all the tree.
	if notification_content == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()


func goto_scene(path, with_hud:=true):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	
	var scene = load(path).instantiate()

	call_deferred("_deferred_goto_scene", scene, with_hud)
	
	
func _deferred_goto_scene(scene, with_hud):
	# It is now safe to remove the current scene.
	get_tree().current_scene.free()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = scene
	
	#Optionally add HUD on top of the scene.
	if with_hud:
		get_tree().current_scene.add_child(hud)

