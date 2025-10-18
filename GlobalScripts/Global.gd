extends Node

var can_pause = false
var cur_level = 0
var can_play_sound = true
func change_mouse_mode():
	if get_tree().paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
