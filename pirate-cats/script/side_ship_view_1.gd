extends Node2D
var moveleft = false
var moveright = false
var flag = 0
var animationf_play = false
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
	if animationf_play == false:
		animationf_play = true
		flag = 1
		$AnimationPlayer.play("FlagRaise")
	elif flag == 0:
		flag = 1
		$AnimationPlayer.play("FlagRaise", -1, 1)
	else:
		flag = 0
		$AnimationPlayer.play("FlagRaise", -1, -1)
	
		
