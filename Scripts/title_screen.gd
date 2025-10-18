extends Control

var next_scene:String

@onready var Transition = $Transition
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.get_node("BGM").play()
	Global.can_pause = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_play_button_up() -> void:
	next_scene = "res://Scenes/GameLevels/TutLevel.tscn"
	Transition.anim.play("transition")
	
func _on_transition_change_scene() -> void:
	get_tree().change_scene_to_file(next_scene)


func _on_button_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits_3d.tscn")


func _on_check_box_toggled(toggled_on: bool) -> void:
	Global.can_play_sound = toggled_on
	if Global.can_play_sound:
		AudioPlayer.get_node("BGM").play()
	else:
		AudioPlayer.get_node("BGM").stop()
