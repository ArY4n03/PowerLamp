extends Control


func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/TitleScreen/title_screen_bg.tscn")


func _on_more_games_button_up() -> void:
	OS.shell_open("https://medhak.itch.io/")
