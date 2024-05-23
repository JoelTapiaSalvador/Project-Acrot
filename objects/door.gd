extends Area2D
class_name Interactable

@onready var manager = $"/root/InteractionManager"
@onready var door_container = self.get_node("DoorContainer")

signal activated
signal deactivated
signal used

func _ready():
	body_entered.connect(_entered)
	body_exited.connect(_exited)

func _entered(body):
	if body is Player:
		manager.register(self)

func _exited(body):
	if body is Player:
		manager.unregister(self)
	
func activate():
	door_container.visible = true

func deactivate():
	door_container.visible = false

func use():
	used.emit()
