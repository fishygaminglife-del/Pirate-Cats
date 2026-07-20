extends Node2D
var tank_locked = false
var moveleft = false
var moveright = false
var m1 = 0
var m2 = 0
var m3 = 0
var map1 = false
var map2 = false
var map3 = false
var map4 = false
var map5 = false
var map6 = false
var panels = [$PH1, $PH2, $PH3, $PH4, $PH5, $PH6]
var maps = [$Map1, $Map2, $Map3, $Map4, $Map5, $Map6]
@onready var butmap = $Map1
var dragging = false
var of = Vector2(0,0)
var in_zone = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		$Map1.global_position = get_global_mouse_position() - of
	if $PH1.get_global_rect().intersects(butmap.get_global_rect()):
		if $Map1 == butmap:
			map1 = true
		if $Map2 == butmap:
			map2 = true
		if $Map3 == butmap:
			map3 = true
		if $Map4 == butmap:
			map4 = true
		if $Map5 == butmap:
			map5 = true
		if $Map6 == butmap:
			map6 = true
		print(butmap)

	else:
		if $Map1 == butmap:
			map1 = false
		if $Map2 == butmap:
			map2 = false
		if $Map3 == butmap:
			map3 = false
		if $Map4 == butmap:
			map4 = false
		if $Map5 == butmap:
			map5 = false
		if $Map6 == butmap:
			map6 = false
		
	if moveleft == true:
		$Camera2D.global_position += Vector2(-150, 0) * delta
	$Camera2D.global_position.x = clamp(
		$Camera2D.global_position.x,
		-151,
		151.5
	)
	if moveright == true:
		$Camera2D.global_position += Vector2(150, 0) * delta
	$Camera2D.global_position.x = clamp(
		$Camera2D.global_position.x,
		-151,
		151.5
	)
# Jelly Fish Tank
func _on_tank_mouse_entered() -> void:
	$JellyFish.play("default")
func _on_tank_mouse_exited() -> void:
	$JellyFish.stop()
func _on_camera_move_left_mouse_exited() -> void:
	moveleft = false
func _on_cat_toys_mouse_entered() -> void:
	$CatToy.play("default")
	$CatToy2.play("default")
	$CatToy3.play("default")
func _on_cat_toys_mouse_exited() -> void:
	$CatToy.stop()
	$CatToy2.stop()
	$CatToy3.stop()
func _on_bottle_mouse_entered() -> void:
	$bottle.play("default")
func _on_bottle_mouse_exited() -> void:
	$bottle.stop()
func _on_door_handle_mouse_entered() -> void:
	$doorhandle.play("default")
func _on_door_handle_mouse_exited() -> void:
	$doorhandle.stop()
func _on_cam_left_mouse_entered() -> void:
	moveleft = true
func _on_cam_left_mouse_exited() -> void:
	moveleft = false
func _on_cam_right_mouse_entered() -> void:
	moveright = true
func _on_cam_right_mouse_exited() -> void:
	moveright = false


func _on_back_ship_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scene/Backship.tscn")


	

func _on_area_m_1_mouse_entered() -> void:
	if not $m1.is_playing():
		if m1 == 0:
			m1 = 1
			$m1.play("rat1 move")
		else:
			m1 = 0
			$m1.play("rat1 move back")


func _on_area_m_2_mouse_entered() -> void:
	if not $m2.is_playing():
		if m2 == 0:
			m2 = 1
			$m2.play("rat2 move")
		else:
			m2 = 0
			$m2.play("rat2 move back")


func _on_area_m_3_mouse_entered() -> void:
	if not $m3.is_playing():
		if m3 == 0:
			m3 = 1
			$m3.play("rat3 move")
		else:
			m3 = 0
			$m3.play("rat3 move back")


func _on_map_1_button_down() -> void:
	dragging = true
	of = get_global_mouse_position() - $Map1.global_position

func _on_map_1_button_up() -> void:
	dragging = false
	
