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
var pan1 = false
var pan2 = false
var pan3 = false
var pan4 = false
var pan5 = false
var pan6 = false
var maps = []
var panels = []
@onready var butmap = $Map1
var dragging1 = false
var of1 = Vector2(0,0)
var in_zone1 = false
var dragging2 = false
var of2 = Vector2(0,0)
var in_zone2 = false
var dragging3 = false
var of3 = Vector2(0,0)
var in_zone3 = false
var dragging4 = false
var of4 = Vector2(0,0)
var in_zone4 = false
var dragging5 = false
var of5 = Vector2(0,0)
var in_zone5 = false
var dragging6 = false
var of6 = Vector2(0,0)
var in_zone6 = false
var get_map = false

func _ready() -> void:
	maps = [$Map1, $Map2, $Map3, $Map4, $Map5, $Map6]
	panels = [$PH1, $PH2, $PH3, $PH4, $PH5, $PH6]

func _process(delta: float) -> void:
	if all_maps_placed():
		if map1 and map2 and map3 and map4 and map5 and map6 and get_map == false:
			get_map = true
			allign_map()
		else:
			$Map1.global_position = Vector2(106,31)
			$Map2.global_position = Vector2(135,-49)
			$Map3.global_position = Vector2(-194,36)
			$Map4.global_position = Vector2(94,-128)
			$Map5.global_position = Vector2(-223,-47)
			$Map6.global_position = Vector2(-186,-125)


	if dragging1:
		$Map1.global_position = get_global_mouse_position() - of1
	if dragging2:
		$Map2.global_position = get_global_mouse_position() - of2
	if dragging3:
		$Map3.global_position = get_global_mouse_position() - of3
	if dragging4:
		$Map4.global_position = get_global_mouse_position() - of4
	if dragging5:
		$Map5.global_position = get_global_mouse_position() - of5
	if dragging6:
		$Map6.global_position = get_global_mouse_position() - of6
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
	
func snap_map(map, panel):
	var panel_center = panel.global_position + (panel.size / 2)
	map.global_position = panel_center - (map.size / 2)
# Dont Mind code below
func _on_tank_mouse_entered() -> void:
	$JellyFish.play("default")
func _on_tank_mouse_exited() -> void:
	$JellyFish.stop()
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
#Start minding code below

func allign_map():
	$Map1.visible = false
	$Map2.visible = false
	$Map3.visible = false
	$Map4.visible = false
	$Map5.visible = false
	$Map6.visible = false
	$MapPieces.visible = true

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
	dragging1 = true
	of1 = get_global_mouse_position() - $Map1.global_position
	butmap = $Map1
	map1 = false
func _on_map_1_button_up() -> void:
	dragging1 = false
	var can_map1 = true
	if $Map1.get_global_rect().intersects($MPArea.get_global_rect()):
		var placeholders = [$PH1, $PH2, $PH3, $PH4, $PH5, $PH6]
		var alimaps = [$Map2, $Map3, $Map4, $Map5, $Map6]
		var closest = null
		var closest_dist = INF

		for ph in placeholders:
			var dist = $Map1.global_position.distance_to(ph.global_position)

			if dist < closest_dist:
				closest_dist = dist
				closest = ph

		if closest:
			if is_panel_taken(closest, $Map1):
				can_map1 = false
			if can_map1:
				snap_map($Map1, closest)

				if closest == $PH1:
					map1 = true
				else:
					map1 = false
			else:
				$Map1.global_position = Vector2(106,31)
	else:
		map1 = false

func _on_map_2_button_down() -> void:
	dragging2 = true
	of2 = get_global_mouse_position() - $Map2.global_position
	butmap = $Map2
	map2 = false
func _on_map_2_button_up() -> void:
	dragging2 = false
	var can_map2 = true
	if $Map2.get_global_rect().intersects($MPArea.get_global_rect()):
		var placeholders = [$PH1, $PH2, $PH3, $PH4, $PH5, $PH6]
		var alimaps = [$Map1, $Map3, $Map4, $Map5, $Map6]
		var closest = null
		var closest_dist = INF

		for ph in placeholders:
			var dist = $Map2.global_position.distance_to(ph.global_position)

			if dist < closest_dist:
				closest_dist = dist
				closest = ph

		if closest:
			if is_panel_taken(closest, $Map2):
				can_map2 = false
			if can_map2:
				snap_map($Map2, closest)

				if closest == $PH2:
					map2 = true
				else:
					map2 = false
			else:
				$Map2.global_position = Vector2(135, -49)
	else:
		map2 = false

func _on_map_3_button_down() -> void:
	dragging3 = true
	of3 = get_global_mouse_position() - $Map3.global_position
	butmap = $Map3
	map3 = false
func _on_map_3_button_up() -> void:
	dragging3 = false
	var can_map3 = true
	if $Map3.get_global_rect().intersects($MPArea.get_global_rect()):
		var placeholders = [$PH1, $PH2, $PH3, $PH4, $PH5, $PH6]
		var alimaps = [$Map1, $Map2, $Map4, $Map5, $Map6]
		var closest = null
		var closest_dist = INF

		for ph in placeholders:
			var dist = $Map3.global_position.distance_to(ph.global_position)

			if dist < closest_dist:
				closest_dist = dist
				closest = ph

		if closest:
			if is_panel_taken(closest, $Map3):
				can_map3 = false
			if can_map3:
				snap_map($Map3, closest)

				if closest == $PH3:
					map3 = true
				else:
					map3 = false
			else:
				$Map3.global_position = Vector2(-194, 36)
	else:
		map3 = false
		
func _on_map_4_button_down() -> void:
	dragging4 = true
	of4 = get_global_mouse_position() - $Map4.global_position
	butmap = $Map4
	map4 = false
func _on_map_4_button_up() -> void:
	dragging4 = false
	var can_map4 = true
	if $Map4.get_global_rect().intersects($MPArea.get_global_rect()):
		var placeholders = [$PH1, $PH2, $PH3, $PH4, $PH5, $PH6]
		var alimaps = [$Map1, $Map2, $Map3, $Map5, $Map6]
		var closest = null
		var closest_dist = INF

		for ph in placeholders:
			var dist = $Map4.global_position.distance_to(ph.global_position)

			if dist < closest_dist:
				closest_dist = dist
				closest = ph

		if closest:
			if is_panel_taken(closest, $Map4):
				can_map4 = false
			if can_map4:
				snap_map($Map4, closest)

				if closest == $PH4:
					map4 = true
				else:
					map4 = false
			else:
				$Map4.global_position = Vector2(94, -128)
	else:
		map4 = false
		
func _on_map_5_button_down() -> void:
	dragging5 = true
	of5 = get_global_mouse_position() - $Map5.global_position
	butmap = $Map5
	map5 = false
func _on_map_5_button_up() -> void:
	dragging5 = false
	var can_map5 = true
	if $Map5.get_global_rect().intersects($MPArea.get_global_rect()):
		var placeholders = [$PH1, $PH2, $PH3, $PH4, $PH5, $PH6]
		var alimaps = [$Map1, $Map2, $Map3, $Map4, $Map6]
		var closest = null
		var closest_dist = INF

		for ph in placeholders:
			var dist = $Map5.global_position.distance_to(ph.global_position)

			if dist < closest_dist:
				closest_dist = dist
				closest = ph

		if closest:
			if is_panel_taken(closest, $Map5):
				can_map5 = false
					
			if can_map5:
				snap_map($Map5, closest)

				if closest == $PH5:
					map5 = true
				else:
					map5 = false
			else:
				$Map5.global_position = Vector2(-223, -47)
	else:
		map5 = false
		
func _on_map_6_button_down() -> void:
	dragging6 = true
	of6 = get_global_mouse_position() - $Map6.global_position
	butmap = $Map6
	map6 = false
func _on_map_6_button_up() -> void:
	dragging6 = false
	var can_map6 = true
	if $Map6.get_global_rect().intersects($MPArea.get_global_rect()):
		var placeholders = [$PH1, $PH2, $PH3, $PH4, $PH5, $PH6]
		var alimaps = [$Map1, $Map2, $Map3, $Map4, $Map5]
		var closest = null
		var closest_dist = INF

		for ph in placeholders:
			var dist = $Map6.global_position.distance_to(ph.global_position)

			if dist < closest_dist:
				closest_dist = dist
				closest = ph

		if closest:
			if is_panel_taken(closest, $Map6):
				can_map6 = false
					
			if can_map6:
				snap_map($Map6, closest)

				if closest == $PH6:
					map6 = true
				else:
					map6 = false
			else:
				$Map6.global_position = Vector2(-186, -125)
	else:
		map6 = false
		
func is_panel_taken(panel, ignore_map):
	for map in maps:
		if map != ignore_map:
			if map.get_global_rect().intersects(panel.get_global_rect()):
				return true

	return false
	
func all_maps_placed():
	for map in maps:
		var placed = false
		
		for panel in panels:
			if map.get_global_rect().intersects(panel.get_global_rect()):
				placed = true
				break
		
		if not placed:
			return false
			
	return true
	
