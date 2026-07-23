extends Node2D
var moveleft = false
var moveright = false
var flag = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

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
	moveleft = true


func _on_move_up_mouse_exited() -> void:
	moveleft = false


func _on_move_d_own_mouse_entered() -> void:
	moveright = true


func _on_move_d_own_mouse_exited() -> void:
	moveright = false




func _on_bubble_bucket_mouse_entered() -> void:
	$BubbleBuket.play("default")


func _on_bubble_bucket_mouse_exited() -> void:
	$BubbleBuket.stop()


func _on_back_ship_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/Backship.tscn")



func _on_front_ship_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/FrontShip.tscn")
