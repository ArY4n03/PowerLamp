extends CanvasLayer


func _on_retry_button_up() -> void:
	get_tree().paused = false
	hide()
	if Global.cur_level > 0:
		get_tree().change_scene_to_file("res://Scenes/GameLevels/Level" +str(Global.cur_level)+ ".tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/GameLevels/TutLevel.tscn")

func _on_title_screen_button_up() -> void:
	get_tree().paused = false
	hide()
	get_tree().change_scene_to_file("res://Scenes/TitleScreen/title_screen_bg.tscn")
