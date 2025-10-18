extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENS = 0.5

var giant = true
var can_change_size = true
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * MOUSE_SENS
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Right", "Left", "Backward", "Forward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		$PlayerModel/AnimationPlayer.play("sprint")
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		$PlayerModel/AnimationPlayer.play("static")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()

func change_size():
	var tween = get_tree().create_tween()
	if not giant:
		tween.tween_property(self,"scale",Vector3(1,1,1),1)
		giant = true
	else:
		tween.tween_property(self,"scale",Vector3(0.2,0.2,0.2),1)
		giant = false
