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
			if $"../MiddlePlate/Bottom1".visible:
				$"../MiddlePlate/SmallBase/Star".visible = true
				$"../MiddlePlate/SmallBase/Star2".visible = true
			if $"../MiddlePlate/Bottom2".visible:
				$"../MiddlePlate/BigBase/Star3".visible = true
				$"../MiddlePlate/BigBase/Star4".visible = true
			if $"../MiddlePlate/Top1-1".visible or $"../MiddlePlate/Top2-1".visible:
				$"../MiddlePlate/NoBase/Star6".visible = true
		$".".global_position = Vector2(1226, 492)

func _on_button_button_down() -> void:
	if can_drag:
		dragging = true
	of = get_global_mouse_position() - global_position
	
