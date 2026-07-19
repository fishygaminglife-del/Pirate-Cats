extends Node2D
var CMid = 0
var CLeft = 0
var CRight = 0
var purp = 0
var green = 1
var yellow = 2
var C1_touchable = false
var C2_touchable = false
var C3_touchable = false
var crab_finished = false
var cancel_crabmove = false
var cancel_crabmove2 = false
var cancel_crabmove3 = false
@onready var mid_start: Vector2 = $CMid.global_position
@onready var left_start = $CLeft.global_position
@onready var right_start = $CRight.global_position
func _ready() -> void:
	crab_move()
	crab_move2()
	crab_move3()
	$AnimationPlayer.play("wavesmove")

func pick_crabs():
	if crab_finished == false:
		crab_finished = true
		CMid = randi_range(0, 1)
		CLeft = randi_range(0, 1)
		CRight = randi_range(0, 1)
		while CMid == 0 and CLeft == 0 and CRight == 0:
			CMid = randi_range(0, 1)
			CLeft = randi_range(0, 1)
			CRight = randi_range(0, 1)
		if CMid == 1:
			crab_move()
		if CLeft == 1:
			crab_move2()
		if CRight == 1:
			crab_move3()
		
func crab_move3():
	if CRight == purp:
		$CRight/greencrab.visible = false
		$CRight/yellowcrab.visible = false
		var target_a: float = $CRight.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CRight, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = true
		if cancel_crabmove3:
			return
		$CRight/purplecrab.play("default")
		await $CRight/purplecrab.animation_finished
		if cancel_crabmove3:
			return
		$CRight/purplecrab.play("default")
		await $CRight/purplecrab.animation_finished
		var target_b: float = $CRight.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CRight, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = false
		if cancel_crabmove3:
			return
		await get_tree().create_timer(0.6).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CRight.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CRight, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = true
		if cancel_crabmove3:
			return
		$CRight/purplecrab.play("default")
		await $CRight/purplecrab.animation_finished
		if cancel_crabmove3:
			return
		$CRight/purplecrab.play("default")
		await $CRight/purplecrab.animation_finished
		if cancel_crabmove3:
			return
		var target_d: float = $CRight.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CRight, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = false
		if cancel_crabmove3:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove3:
			return
		$"Crabwave1-1".visible = false
		var target_e: float = $CRight.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CRight, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = true
		if cancel_crabmove3:
			return
		$CRight/purplecrab.play("default")
		await $CRight/purplecrab.animation_finished
		if cancel_crabmove3:
			return
		$CRight/purplecrab.play("default")
		await $CRight/purplecrab.animation_finished
		var target_f: float = $CRight.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CRight, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = false
	elif CRight == green:
		$CRight/yellowcrab.visible = false
		$CRight/purplecrab.visible = false
		var target_a: float = $CRight.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CRight, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = true
		if cancel_crabmove3:
			return
		$CRight/greencrab.play("default")
		await $CRight/greencrab.animation_finished
		if cancel_crabmove3:
			return
		$CRight/greencrab.play("default")
		await $CRight/greencrab.animation_finished
		if cancel_crabmove3:
			return
		var target_b: float = $CRight.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CRight, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = false
		if cancel_crabmove3:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove3:
			return
		$"Crabwave2-1".visible = false
		var target_c: float = $CRight.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CRight, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = true
		if cancel_crabmove3:
			return
		$CRight/greencrab.play("default")
		await $CRight/greencrab.animation_finished
		if cancel_crabmove3:
			return
		$CRight/greencrab.play("default")
		await $CRight/greencrab.animation_finished
		if cancel_crabmove3:
			return
		var target_d: float = $CRight.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CRight, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = false
		if cancel_crabmove3:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove3:
			return
		$"Crabwave1-1".visible = false
		var target_e: float = $CRight.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CRight, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = true
		if cancel_crabmove3:
			return
		$CRight/greencrab.play("default")
		await $CRight/greencrab.animation_finished
		if cancel_crabmove3:
			return
		$CRight/greencrab.play("default")
		await $CRight/greencrab.animation_finished
		if cancel_crabmove3:
			return
		var target_f: float = $CRight.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CRight, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = false
	elif CRight == yellow:
		$CRight/greencrab.visible = false
		$CRight/purplecrab.visible = false
		
		var target_a: float = $CRight.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CRight, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = true
		if cancel_crabmove3:
			return
		$CRight/yellowcrab.play("default")
		await $CRight/yellowcrab.animation_finished
		if cancel_crabmove3:
			return
		$CRight/yellowcrab.play("default")
		await $CRight/yellowcrab.animation_finished
		if cancel_crabmove3:
			return
		var target_b: float = $CRight.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CRight, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = false
		if cancel_crabmove3:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove3:
			return
		$"Crabwave2-1".visible = false
		var target_c: float = $CRight.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CRight, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = true
		if cancel_crabmove3:
			return
		$CRight/yellowcrab.play("default")
		await $CRight/yellowcrab.animation_finished
		if cancel_crabmove3:
			return
		$CRight/yellowcrab.play("default")
		await $CRight/yellowcrab.animation_finished
		var target_d: float = $CRight.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CRight, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = false
		if cancel_crabmove3:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove3:
			return
		$"Crabwave1-1".visible = false
		var target_e: float = $CRight.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CRight, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = true
		if cancel_crabmove3:
			return
		$CRight/yellowcrab.play("default")
		await $CRight/yellowcrab.animation_finished
		if cancel_crabmove3:
			return
		$CRight/yellowcrab.play("default")
		await $CRight/yellowcrab.animation_finished
		if cancel_crabmove3:
			return
		var target_f: float = $CRight.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CRight, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		C3_touchable = false
	$Panel3.visible = true
	await get_tree().create_timer(0.1).timeout
	$Panel3.visible = false
	pick_crabs()
func crab_move2():
		# Left
	if CLeft == purp:
		$CLeft/greencrab.visible = false
		$CLeft/yellowcrab.visible = false
		var target_a: float = $CLeft.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CLeft, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		$CLeft/purplecrab.play("default")
		await $CLeft/purplecrab.animation_finished
		if cancel_crabmove2:
			return
		$CLeft/purplecrab.play("default")
		await $CLeft/purplecrab.animation_finished
		if cancel_crabmove2:
			return
		var target_b: float = $CLeft.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CLeft, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove2:
			return
		if cancel_crabmove2:
			return
		$"Crabwave2-1".visible = false
		var target_c: float = $CLeft.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CLeft, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		$CLeft/purplecrab.play("default")
		await $CLeft/purplecrab.animation_finished
		if cancel_crabmove2:
			return
		$CLeft/purplecrab.play("default")
		await $CLeft/purplecrab.animation_finished
		if cancel_crabmove2:
			return
		var target_d: float = $CLeft.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CLeft, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove2:
			return
		$"Crabwave1-1".visible = false
		var target_e: float = $CLeft.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CLeft, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		$CLeft/purplecrab.play("default")
		await $CLeft/purplecrab.animation_finished
		if cancel_crabmove2:
			return
		$CLeft/purplecrab.play("default")
		await $CLeft/purplecrab.animation_finished
		if cancel_crabmove2:
			return
		var target_f: float = $CLeft.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CLeft, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	elif CLeft == green:
		$CLeft/yellowcrab.visible = false
		$CLeft/purplecrab.visible = false
		var target_a: float = $CLeft.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CLeft, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		$CLeft/greencrab.play("default")
		await $CLeft/greencrab.animation_finished
		if cancel_crabmove2:
			return
		$CLeft/greencrab.play("default")
		await $CLeft/greencrab.animation_finished
		if cancel_crabmove2:
			return
		var target_b: float = $CLeft.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CLeft, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove2:
			return
		$"Crabwave2-1".visible = false
		var target_c: float = $CLeft.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CLeft, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		$CLeft/greencrab.play("default")
		await $CLeft/greencrab.animation_finished
		if cancel_crabmove2:
			return
		$CLeft/greencrab.play("default")
		await $CLeft/greencrab.animation_finished
		if cancel_crabmove2:
			return
		var target_d: float = $CLeft.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CLeft, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove2:
			return
		$"Crabwave1-1".visible = false
		var target_e: float = $CLeft.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CLeft, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		$CLeft/greencrab.play("default")
		await $CLeft/greencrab.animation_finished
		if cancel_crabmove2:
			return
		$CLeft/greencrab.play("default")
		await $CLeft/greencrab.animation_finished
		var target_f: float = $CLeft.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CLeft, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	elif CLeft == yellow:
		$CLeft/greencrab.visible = false
		$CLeft/purplecrab.visible = false
		var target_a: float = $CLeft.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CLeft, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		$CLeft/yellowcrab.play("default")
		await $CLeft/yellowcrab.animation_finished
		if cancel_crabmove2:
			return
		$CLeft/yellowcrab.play("default")
		await $CLeft/yellowcrab.animation_finished
		if cancel_crabmove2:
			return
		var target_b: float = $CLeft.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CLeft, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove2:
			return
		$"Crabwave2-1".visible = false
		var target_c: float = $CLeft.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CLeft, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		$CLeft/yellowcrab.play("default")
		await $CLeft/yellowcrab.animation_finished
		if cancel_crabmove2:
			return
		$CLeft/yellowcrab.play("default")
		await $CLeft/yellowcrab.animation_finished
		if cancel_crabmove2:
			return
		var target_d: float = $CLeft.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CLeft, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove2:
			return
		$"Crabwave1-1".visible = false
		var target_e: float = $CLeft.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CLeft, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove2:
			return
		$CLeft/yellowcrab.play("default")
		await $CLeft/yellowcrab.animation_finished
		if cancel_crabmove2:
			return
		var target_f: float = $CLeft.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CLeft, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	$Panel2.visible = true
	await get_tree().create_timer(0.1).timeout
	$Panel2.visible = false
	pick_crabs()
func crab_move():
	# Middle
	if CMid == purp:
		$CMid/greencrab.visible = false
		$CMid/yellowcrab.visible = false
		var target_a: float = $CMid.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CMid, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		$CMid/purplecrab.play("default")
		await $CMid/purplecrab.animation_finished
		if cancel_crabmove:
			return
		$CMid/purplecrab.play("default")
		await $CMid/purplecrab.animation_finished
		if cancel_crabmove:
			return
		var target_b: float = $CMid.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CMid, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove:
			return
		$"Crabwave2-1".visible = false
		var target_c: float = $CMid.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CMid, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		$CMid/purplecrab.play("default")
		await $CMid/purplecrab.animation_finished
		if cancel_crabmove:
			return
		$CMid/purplecrab.play("default")
		await $CMid/purplecrab.animation_finished
		if cancel_crabmove:
			return
		var target_d: float = $CMid.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CMid, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove:
			return
		$"Crabwave1-1".visible = false
		var target_e: float = $CMid.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CMid, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		$CMid/purplecrab.play("default")
		await $CMid/purplecrab.animation_finished
		if cancel_crabmove:
			return
		$CMid/purplecrab.play("default")
		await $CMid/purplecrab.animation_finished
		if cancel_crabmove:
			return
		var target_f: float = $CMid.position.y + 50
		var tween6: Tween = create_tween()
		tween6.tween_property($CMid, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	elif CMid == green:
		$CMid/yellowcrab.visible = false
		$CMid/purplecrab.visible = false
		var target_a: float = $CMid.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CMid, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		$CMid/greencrab.play("default")
		await $CMid/greencrab.animation_finished
		if cancel_crabmove:
			return
		$CMid/greencrab.play("default")
		await $CMid/greencrab.animation_finished
		if cancel_crabmove:
			return
		var target_b: float = $CMid.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CMid, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove:
			return
		$"Crabwave2-1".visible = false
		var target_c: float = $CMid.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CMid, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		$CMid/greencrab.play("default")
		await $CMid/greencrab.animation_finished
		if cancel_crabmove:
			return
		$CMid/greencrab.play("default")
		await $CMid/greencrab.animation_finished
		if cancel_crabmove:
			return
		var target_d: float = $CMid.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CMid, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove:
			return
		$"Crabwave1-1".visible = false
		var target_e: float = $CMid.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CMid, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		$CMid/greencrab.play("default")
		await $CMid/greencrab.animation_finished
		if cancel_crabmove:
			return
		$CMid/greencrab.play("default")
		await $CMid/greencrab.animation_finished
		if cancel_crabmove:
			return
		var target_f: float = $CMid.position.y + 50
		var tween6: Tween = create_tween()
		tween6.tween_property($CMid, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	elif CMid == yellow:
		$CMid/greencrab.visible = false
		$CMid/purplecrab.visible = false
		var target_a: float = $CMid.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CMid, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		$CMid/yellowcrab.play("default")
		await $CMid/yellowcrab.animation_finished
		if cancel_crabmove:
			return
		$CMid/yellowcrab.play("default")
		await $CMid/yellowcrab.animation_finished
		if cancel_crabmove:
			return
		var target_b: float = $CMid.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CMid, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove:
			return
		$"Crabwave2-1".visible = false
		var target_c: float = $CMid.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CMid, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		$CMid/yellowcrab.play("default")
		await $CMid/yellowcrab.animation_finished
		if cancel_crabmove:
			return
		$CMid/yellowcrab.play("default")
		await $CMid/yellowcrab.animation_finished
		if cancel_crabmove:
			return
		var target_d: float = $CMid.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CMid, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		await get_tree().create_timer(0.6).timeout
		if cancel_crabmove:
			return
		$"Crabwave1-1".visible = false
		var target_e: float = $CMid.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CMid, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		if cancel_crabmove:
			return
		$CMid/yellowcrab.play("default")
		await $CMid/yellowcrab.animation_finished
		if cancel_crabmove:
			return
		$CMid/yellowcrab.play("default")
		await $CMid/yellowcrab.animation_finished
		if cancel_crabmove:
			return
		var target_f: float = $CMid.position.y + 50
		var tween6: Tween = create_tween()
		tween6.tween_property($CMid, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	$Panel.visible = true
	await get_tree().create_timer(0.1).timeout
	$Panel.visible = false
	pick_crabs()
