extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len($Area3D_1.get_overlapping_bodies()) > 0:
		$Label1.show()
	else:
		$Label1.hide()
	if len($Area3D_2.get_overlapping_bodies()) > 0:
		$Label2.show()
	else:
		$Label2.hide()
