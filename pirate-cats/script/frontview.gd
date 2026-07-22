extends Node2D
var moveup = false
var movedown = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Camera2D.global_position = Vector2 (562, 485)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if movedown == true:
		$Camera2D.global_position += Vector2(0, 150) * delta
	$Camera2D.global_position.y = clamp(
		$Camera2D.global_position.y,
		150,
		486
	)
	if moveup == true:
		$Camera2D.global_position += Vector2(0, -150) * delta
	$Camera2D.global_position.y = clamp(
		$Camera2D.global_position.y,
		150,
		486
	)

func _on_fontain_play_mouse_entered() -> void:
	$Fontain.play("default")

func _on_fontain_play_mouse_exited() -> void:
	$Fontain.stop()

func _on_birdhouse_play_mouse_entered() -> void:
	$"Bird house".play("default")

func _on_birdhouse_play_mouse_exited() -> void:
	$"Bird house".stop()


func _on_parrot_mg_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/parrot.tscn")


func _on_move_up_mouse_entered() -> void:
	moveup = true


func _on_move_up_mouse_exited() -> void:
	moveup = false


func _on_move_d_own_mouse_entered() -> void:
	movedown = true


func _on_move_d_own_mouse_exited() -> void:
	movedown = false


func _on_side_view_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/SideShipView1.tscn")

func _on_side_view_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/SideShipView2.tscn")
