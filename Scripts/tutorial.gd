extends Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_next_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/GameLevels/Level1.tscn")
