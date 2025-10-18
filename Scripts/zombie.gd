extends CharacterBody3D
@onready var player = find_parent("World").get_node("Player")
@onready var nav_agent = $NavigationAgent3D
@onready var state_machine = $AnimationTree.get("parameters/playback")
@export var speed = 2
@onready var audio_player = [$AudioStreamPlayer1,$AudioStreamPlayer2,$AudioStreamPlayer3]
var active = false

func _ready() -> void:
	set_state("idle")
	
func set_state(name):
	state_machine.travel(name)

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
		set_state("walk")
		if global_position.distance_to(player.global_position) < 1:
			find_parent("World").gameover()
	move_and_slide()
		

func get_damaged():
	set_state('die')
	await $AnimationTree.animation_finished
	queue_free()


@warning_ignore("unused_parameter")
func _on_area_3d_body_entered(body: Node3D) -> void:
	if not active:
		active = true
func play_audio():
	var current_audio = audio_player[randi() % audio_player.size()]
	
	current_audio.play()


func _on_timer_timeout() -> void:
	if Global.can_play_sound:
		play_audio()
