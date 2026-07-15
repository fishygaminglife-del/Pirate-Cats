extends Sprite2D
var dragging = false
var of = Vector2(0,0)
var can_drag = true
var in_zone = false

func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() - of
	


func _on_button_button_up() -> void:
	if can_drag:
		dragging = false
		if $Panel2.get_global_rect().intersects($"../CastlePannel".get_global_rect()):
			$".".visible = false
			if $"../MiddlePlate/Top1".visible or $"../MiddlePlate/Top1-1".visible:
				$".".visible = true
			else:
				in_zone = true
				can_drag = false
				$".".visible = false
				if $"../MiddlePlate/Bottom1".visible or $"../MiddlePlate/Bottom2".visible:
					$"../MiddlePlate/Top2".visible = true
				else:
					$"../MiddlePlate/Top2-1".visible = true
		$".".global_position = Vector2(1065.2, 480.55)

func _on_button_button_down() -> void:
	if can_drag:
		dragging = true
	of = get_global_mouse_position() - global_position
	
