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

func _on_crab_out_mouse_entered() -> void:
	$AnimatedSprite2D.play("default")

func _on_crab_out_mouse_exited() -> void:
	$AnimatedSprite2D.stop()

func _on_dyna_play_mouse_entered() -> void:
	$Dynamite.play("default")

func _on_dyna_play_mouse_exited() -> void:
	$Dynamite.stop()

func _on_bouy_play_mouse_entered() -> void:
	$Bouy.play("default")

func _on_bouy_play_mouse_exited() -> void:
	$Bouy.stop()


func _on_cam_left_mouse_entered() -> void:
	moveleft = true


func _on_cam_left_mouse_exited() -> void:
	moveleft = false


func _on_cam_right_mouse_entered() -> void:
	moveright = true

func _on_cam_right_mouse_exited() -> void:
	moveright = false

func _on_flag_raise_mouse_entered() -> void:
	var anim = $AnimationPlayer.get_animation("FlagRaise")

	if flag == 0:
		flag = 1
		$AnimationPlayer.play("FlagRaise", -1, 1.0)
	else:
		flag = 0
		var current_time = $AnimationPlayer.current_animation_position
		$AnimationPlayer.play("FlagRaise", -1, -1.0)
		$AnimationPlayer.seek(current_time, true)


func _on_back_ship_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/Backship.tscn")


func _on_front_ship_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/FrontShip.tscn")
