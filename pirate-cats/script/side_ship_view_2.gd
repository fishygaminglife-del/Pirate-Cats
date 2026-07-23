extends Node2D
var moveleft = false
var moveright = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.rightcam == true:
		$Camera2D.position.x = 288
	elif Global.leftcam == true:
		$Camera2D.position.x = 812

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moveleft == true:
		$Camera2D.global_position += Vector2(-150, 0) * delta
	$Camera2D.global_position.x = clamp(
		$Camera2D.global_position.x,
		288,
		813
	)
	if moveright == true:
		$Camera2D.global_position += Vector2(150, 0) * delta
	$Camera2D.global_position.x = clamp(
		$Camera2D.global_position.x,
		288,
		813
	)






func _on_move_left_mouse_entered() -> void:
	moveleft = true


func _on_move_left_mouse_exited() -> void:
	moveleft = false


func _on_moveright_mouse_entered() -> void:
	moveright = true


func _on_moveright_mouse_exited() -> void:
	moveright = false


func _on_front_ship_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		Global.leftcam = false
		Global.rightcam = true
		get_tree().change_scene_to_file("res://scene/FrontShip.tscn")


func _on_back_ship_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		Global.leftcam = true
		Global.rightcam = false
		get_tree().change_scene_to_file("res://scene/Backship.tscn")
