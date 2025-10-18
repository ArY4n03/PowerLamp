extends Control

var next_scene:String
@onready var Transition = $Transition
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.can_pause = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_play_button_up() -> void:
	next_scene = "res://Scenes/GameLevels/TutLevel.tscn"
	Transition.anim.play("transition")
	
func _on_controls_button_up() -> void:
	pass # Replace with function body.


func _on_transition_change_scene() -> void:
	get_tree().change_scene_to_file(next_scene)
