extends Area2D

var player
var ladder_detector

var t = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("ladders")
	call_deferred("set_up")


func set_up():
	player = get_tree().get_current_scene().get_node("Player")
	ladder_detector = player.get_node("LadderDetector")

	if ladder_detector:
		ladder_detector.area_entered.connect(_on_ladder_detector_area_entered)
		ladder_detector.area_exited.connect(_on_ladder_detector_area_exited)


func _on_ladder_detector_area_entered(body):
	if body.is_in_group("ladders"):
		player.on_ladder = true


func _on_ladder_detector_area_exited(body):
	if body.is_in_group("ladders"):
		player.on_ladder = false
		player.velocity.y = 0
