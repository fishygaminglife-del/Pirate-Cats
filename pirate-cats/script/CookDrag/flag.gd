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
		if $Panel2.get_global_rect().intersects($"../ToppingsPannel".get_global_rect()):
			can_drag = false
			if $"../MiddlePlate/Top2".visible == true or $"../MiddlePlate/Top1".visible == true:
				$"../MiddlePlate/Flag1".visible = true
			elif $"../MiddlePlate/Top1-1".visible == true or $"../MiddlePlate/Top2-1".visible == true:
				$"../MiddlePlate/Flag2".visible = true
			elif $"../MiddlePlate/Bottom1".visible  == true or $"../MiddlePlate/Bottom2".visible == true:
				$"../MiddlePlate/Flag3".visible = true
		$".".global_position = Vector2(1670, 520)

func _on_button_button_down() -> void:
	if can_drag:
		dragging = true
	of = get_global_mouse_position() - global_position
	
