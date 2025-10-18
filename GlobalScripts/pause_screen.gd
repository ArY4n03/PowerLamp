extends CanvasLayer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		if Global.can_pause:
			get_tree().paused = not get_tree().paused
			change_visibilty_of_elements()
			
func _on_continue_button_up() -> void:
	get_tree().paused = false
	change_visibilty_of_elements()
	
func _on_title_screen_button_up() -> void:
	get_tree().paused = false
	change_visibilty_of_elements()
	get_tree().change_scene_to_file("res://Scenes/TitleScreen/title_screen_bg.tscn")

func change_visibilty_of_elements():
	$TextureRect.visible = get_tree().paused
	$HBoxContainer.visible = get_tree().paused
	Global.change_mouse_mode()
	
