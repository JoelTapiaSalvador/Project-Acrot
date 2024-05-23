extends Node


# When the hallways door emits signal of being used by player, change scene to hallway.
func _on_hallway_door_used():
	Main.goto_scene("res://levels/halway.tscn")
	
