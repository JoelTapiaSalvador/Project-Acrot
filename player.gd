extends CharacterBody2D
class_name Player

const LADDER_VELOCITY = 100.0
const VELOCITY = 400.0
const JUMP_VELOCITY = -350.0

var on_ladder = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(_delta):
	print(on_ladder)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.slide(collision.get_normal())

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * VELOCITY
	else:
		velocity.x = move_toward(velocity.x, 0, VELOCITY)
		
	# Handle ladders
	var direction_ladder = Input.get_axis("ladder_down", "ladder_up")
	if on_ladder:
		if direction_ladder:
			velocity.y = - direction_ladder * LADDER_VELOCITY
	# Add the gravity.
	elif not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
	
	


func _on_ladder_body_entered(_body): # Modify this funtion if ever in  scene there is more than one PhysicsBody2D
	print("entered ladder")
	on_ladder = true 
	


func _on_ladder_body_exited(_body): # Modify this funtion if ever in  scene there is more than one PhysicsBody2D
	print("left laddder")
	on_ladder = false
	velocity.y = 0
