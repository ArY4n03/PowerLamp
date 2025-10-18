extends CharacterBody3D

@onready var player = find_parent("World").get_node("Player")
@onready var nav_agent = $NavigationAgent3D
@export var speed = 2

var active = false

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if active:
		velocity = Vector3.ZERO
		nav_agent.set_target_position(player.global_transform.origin)
		var next_nav_point = nav_agent.get_next_path_position()
		velocity = (next_nav_point - global_transform.origin).normalized() * speed	
		look_at(Vector3(player.global_position.x,player.global_position.y,player.global_position.z),Vector3.UP)
	move_and_slide()
		

func get_damaged():
	$ZombieModel/AnimationPlayer.play("die")
	await $ZombieModel/AnimationPlayer.animation_finished
	queue_free()


@warning_ignore("unused_parameter")
func _on_area_3d_body_entered(body: Node3D) -> void:
	if not active:
		active = true
