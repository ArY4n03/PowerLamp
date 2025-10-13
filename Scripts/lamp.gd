extends StaticBody3D

enum type {size_manipulation,damaging,triggering}

@export var lamp_type:type
@onready var player = find_parent("World").get_node("Player")

signal trigger
var is_active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LampText.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len($Area3D.get_overlapping_bodies()) > 0:
		if Input.is_action_just_pressed("interact"):
			is_active = not is_active
	
	if is_active:
		activate_lamp()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		$LampText.show()

func activate_lamp():
	match lamp_type:
		type.size_manipulation:
			player.change_size()
		type.damaging:
			damage_zombies()
		type.triggering:
			emit_signal("trigger")

func damage_zombies():
	for body in $Area3D.get_overlapping_bodies():
		if body.has_method("get_damaged"):
			body.get_damaged()
			
func _on_area_3d_body_exited(body: Node3D) -> void:
	$LampText.hide()
