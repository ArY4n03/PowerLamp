extends StaticBody3D

@export var next_level:PackedScene
var can_transition = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len($Area3D.get_overlapping_bodies()) > 0 and can_transition:
		if Input.is_action_just_pressed("interact"):
			$Transition.anim.play('transition')
			can_transition = false

func change_level():
	get_tree().change_scene_to_packed(next_level)
