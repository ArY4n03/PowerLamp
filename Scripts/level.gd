extends Node3D

@export var cur_level = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.cur_level = cur_level
	Global.can_pause = true

func gameover():
	get_tree().paused = true
	Global.change_mouse_mode()
	GameOverScreen.show()
