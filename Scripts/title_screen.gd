extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_play_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/GameLevels/Level1.tscn")

func _on_controls_button_up() -> void:
	pass # Replace with function body.
