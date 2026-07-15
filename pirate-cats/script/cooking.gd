extends Node2D
var layer1
var layer2
var topping
var lone
var ltwo
var star
var shell
var flag
var plate = 0
var plate_anim = false
var base
var top
func _ready() -> void:
	$Camera2D.position = Vector2(299,463)
	$MiddlePlate.self_modulate = Color(1.0, 1.0, 1.0, 0.0)
	$MiddlePlate.global_position = Vector2(75,510)
	order()
	
func _process(delta: float) -> void:
	if $MiddlePlate/Panel.get_global_rect().intersects($PlatePanel.get_global_rect()) and plate_anim == false and $MiddlePlate.in_zone == true:
		plate_anim = true
		await get_tree().create_timer(0.4).timeout
		$AnimationPlayer.play("PlateFinish")
		await get_tree().create_timer(0.65).timeout
		$AnimationPlayer2.play("PlateMenu")
	if plate == 1:
		$Plates/Plate.visible = false
	elif plate == 2:
		$Plates/Plate2.visible = false
	elif plate == 3:
		$Plates/Plate3.visible = false
	elif plate == 4:
		$Plates/Plate4.visible = false
	elif plate == 5:
		$Plates/Plate5.visible = false
	elif plate == 6:
		$Plates/Plate6.visible = false
	elif plate == 7:
		$Plates/Plate7.visible = false

		
func order():
	print("works")
	layer1 = randi_range(1,2)
	layer2 = randi_range(1,2)
	star = randi_range(1,2)
	shell = randi_range(1,2)
	flag = randi_range(1,2)
	
	while layer1 == 1 and layer2 == 1:
		layer1 = randi_range(1,2)
		layer2 = randi_range(1,2)
	
	if layer1 == 2:
		lone = randi_range(1,2)
		if lone == 1:
			$Order/Bottom1.visible = true
			$Order/Bottom2.visible = false
		else:
			$Order/Bottom1.visible = false
			$Order/Bottom2.visible = true
			
	if layer2 == 2:
		ltwo = randi_range(1,2)
		if ltwo == 1:
			if layer1 == 2:
				$Order/Top2.visible = true
			else:
				$"Order/Top2-1".visible = true
		else:
			if layer1 == 2:
				$Order/Top1.visible = true
			else:
				$"Order/Top1-1".visible = true

	if star == 2:
		if layer1 == 2:
			if $Order/Bottom1.visible == true:
				$Order/SmallBase/Star.visible = true
				$Order/SmallBase/Star2.visible = true
			else:
				$Order/BigBase/Star3.visible = true
				$Order/BigBase/Star4.visible = true
		else:
			$Order/NoBase/Star6.visible = true
	if shell == 2:
		if layer1 == 2:
			if $Order/Bottom1.visible == true:
				$Order/SmallBase/Clam.visible = true
				$Order/SmallBase/Clam2.visible = true
			else:
				$Order/BigBase/Clam3.visible = true
				$Order/BigBase/Clam4.visible = true
		else:
			$Order/NoBase/Clam5.visible = true
	if flag == 2:
		if layer2 == 2:
			if layer1 == 2:
				$Order/Flag3.visible = true
			else:
				$Order/Flag2.visible = true
		else:
			$Order/Flag1.visible = true
			
func plate_check():
	pass
func _on_buttonmove_pressed() -> void:
	$AnimationPlayer.play("CastleFinish")
	await get_tree().create_timer(0.65).timeout
	$AnimationPlayer2.play("CastleMenu")
