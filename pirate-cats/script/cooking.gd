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
#CheckOrder
var OBase1 = false
var OBase2 = false
var OTop1 = false
var OTop2 = false
var OShell = false
var OFlag = false
var OStar = false
#OnPlate
var PBase1 = false
var PBase2 = false
var PTop1 = false
var PTop2 = false
var PShell = false
var PFlag = false
var PStar = false
# Correct Items
var CBase1 = false
var CBase2 = false
var CTop1 = false
var CTop2 = false
var CShell = false
var CFlag = false
var CStar = false

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
	OTop1 = false
	OTop2 = false
	OShell = false
	OFlag = false
	OStar = false
		#OnPlate
	PBase1 = false
	PBase2 = false
	PTop1 = false
	PTop2 = false
	PShell = false
	PFlag = false
	PStar = false
	# Correct Items
	CBase1 = false
	CBase2 = false
	CTop1 = false
	CTop2 = false
	CShell = false
	CFlag = false
	CStar = false
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
			OBase1 = true
		else:
			$Order/Bottom1.visible = false
			$Order/Bottom2.visible = true
			OBase2 = true
			
	if layer2 == 2:
		ltwo = randi_range(1,2)
		if ltwo == 1:
			OTop1 = true
			if layer1 == 2:
				$Order/Top2.visible = true
			else:
				$"Order/Top2-1".visible = true
		else:
			CTop2 = true
			if layer1 == 2:
				$Order/Top1.visible = true
			else:
				$"Order/Top1-1".visible = true

	if star == 2:
		OStar = true
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
		OShell = true
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
		OFlag = true
		if layer2 == 2:
			if layer1 == 2:
				$Order/Flag1.visible = true
			else:
				$Order/Flag2.visible = true
		else:
			$Order/Flag3.visible = true
			
func plate_check():
	if $MiddlePlate/Bottom1.visible == true:
		PBase1 = true
	if $MiddlePlate/Bottom2.visible == true:
		PBase2 = true
	if $MiddlePlate/Top1.visible == true or $"MiddlePlate/Top1-1".visible == true:
		PTop1 = true
	if $MiddlePlate/Top2.visible == true or $"MiddlePlate/Top2-1".visible == true:
		PTop2 = true
	if $MiddlePlate/SmallBase/Clam.visible == true or $MiddlePlate/BigBase/Clam3.visible == true or $MiddlePlate/NoBase/Clam5.visible == true:
		PShell = true
	if $MiddlePlate/SmallBase/Star.visible == true or $MiddlePlate/BigBase/Star3.visible == true or $MiddlePlate/NoBase/Star6.visible == true:
		PStar = true
	if $MiddlePlate/Flag1.visible == true or $MiddlePlate/Flag2.visible == true or $MiddlePlate/Flag3.visible == true:
		PFlag = true
	
	if OBase1 == PBase1:
		CBase1 = true
		$B1.modulate = Color(4.869, 4.869, 4.869)
		print(CBase1)
	if OBase2 == PBase2:
		CBase2 = true
		$B2.modulate = Color(4.869, 4.869, 4.869)
		print(CBase2)
	if OTop1 == PTop1 :
		CTop1 = true
		$T1.modulate = Color(4.869, 4.869, 4.869)
		print(CTop1)
	if OTop2 == PTop2:
		CTop2 = true
		$T2.modulate = Color(4.869, 4.869, 4.869)
		print(CTop2 )
	if OShell == PShell:
		CShell = true
		$C1.modulate = Color(4.869, 4.869, 4.869)
		print(CShell)
	if OStar == PStar:
		CStar = true
		$S1.modulate = Color(4.869, 4.869, 4.869)
		print(CStar)
	if OFlag == PFlag:
		CFlag  = true
		$F1.modulate = Color(4.869, 4.869, 4.869)
		print(CFlag )
func _on_buttonmove_pressed() -> void:
	$AnimationPlayer.play("CastleFinish")
	await get_tree().create_timer(0.65).timeout
	$AnimationPlayer2.play("CastleMenu")

func _on_buttonmove_1_pressed() -> void:
	$AnimationPlayer.play("ToppingsFinish")
	plate_check()
