extends CanvasLayer

@onready var anim = $AnimationPlayer


signal change_scene

func _change_scene():
	pass #adding this because if somehow fixes an error 
	
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	emit_signal("change_scene")
	hide()
	
