extends Node2D
var moveleft = false
var moveright = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.rightcam == true:
		$Camera2D.position.x = 351
	elif Global.leftcam == true:
		$Camera2D.position.x = 876

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moveleft == true:
		$Camera2D.global_position += Vector2(-150, 0) * delta
	$Camera2D.global_position.x = clamp(
		$Camera2D.global_position.x,
		351,
		876.5
	)
	if moveright == true:
		$Camera2D.global_position += Vector2(150, 0) * delta
	$Camera2D.global_position.x = clamp(
		$Camera2D.global_position.x,
		351,
		876.5
	)

func _on_cam_left_mouse_entered() -> void:
	moveleft = true
func _on_cam_left_mouse_exited() -> void:
	moveleft = false
func _on_cam_right_mouse_entered() -> void:
	moveright = true
func _on_cam_right_mouse_exited() -> void:
	moveright = false


func _on_fish_mouse_entered() -> void:
	if SaveManager.fish_played == true:
		$fish.play("have_fish")
	else:
		$fish.play("default")
func _on_fish_mouse_exited() -> void:
	$fish.stop()

func _on_cook_mouse_entered() -> void:
	$pan.play("default")
func _on_cook_mouse_exited() -> void:
	$pan.stop()


func _on_fishing_mg_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/fishing.tscn")


func _on_cooking_mg_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/cooking.tscn")


func _on_captain_mg_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/Captain Room.tscn")


func _on_side_ship_view_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		Global.leftcam = true
		Global.rightcam = false
		
		get_tree().change_scene_to_file("res://scene/SideShipView1.tscn")
	

func _on_captains_room_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/Captain Room.tscn")


func _on_side_ship_view_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		Global.rightcam = true
		Global.leftcam = false
		get_tree().change_scene_to_file("res://scene/SideShipView2.tscn")
