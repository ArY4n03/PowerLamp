extends StaticBody3D

enum type {size_manipulation,damaging,light}

@export var lamp_type:type
@onready var player = find_parent("World").get_node("Player")

var is_active = false
var can_damage_enemies = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LampText.hide()
	match lamp_type:
		type.size_manipulation:
			$OmniLight3D.light_color = Color(1.0, 0.8, 0.0, 0.667)
		type.damaging:
			$OmniLight3D.light_color = Color(0.73, 0.0, 0.0, 0.667)
		type.light:
			$OmniLight3D.light_color = Color(0.013, 0.013, 0.0, 0.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if len($Area3D.get_overlapping_bodies()) > 0:
		if Input.is_action_just_pressed("interact"):
			is_active = not is_active
	
	if is_active:
		activate_lamp()
		is_active = false
	
	if can_damage_enemies:
		damage_zombies()
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		$LampText.show()

func activate_lamp():
	match lamp_type:
		type.size_manipulation:
			player.change_size()
		type.damaging:
			if not can_damage_enemies:
				can_damage_enemies = true
				$OmniLight3D.light_color = Color(1.612, 0.0, 0.0, 0.82)
				$OmniLight3D.omni_range = 7.0
		type.light:
			$OmniLight3D.light_color = Color(0.912, 0.912, 0.01, 0.608)
			$OmniLight3D.omni_range = 10.0
			
func damage_zombies():
	for body in $Area3D.get_overlapping_bodies():
		if body.has_method("get_damaged"):
			body.get_damaged()
			
@warning_ignore("unused_parameter")
func _on_area_3d_body_exited(body: Node3D) -> void:
	$LampText.hide()
