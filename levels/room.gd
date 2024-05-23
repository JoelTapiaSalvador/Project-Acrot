extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_hallway_door_used(body):
	if body is Player:
		Main.goto_scene("res://levels/halway.tscn")
	
