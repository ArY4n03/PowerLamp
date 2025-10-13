extends CharacterBody3D

@onready var player = find_parent("World").get_node("Player")
@onready var nav_agent = $NavigationAgent3D
const speed = 2

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
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
