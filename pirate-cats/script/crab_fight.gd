extends Node2D
var CMid = 0
var CLeft = 0
var CRight = 0
var purp = 0
var green = 1
var yellow = 2
@onready var mid_start: Vector2 = $CMid.global_position
@onready var left_start = $CLeft.global_position
@onready var right_start = $CRight.global_position
func _ready() -> void:
	crab_move()
	crab_move2()
	crab_move3()
	$AnimationPlayer.play("wavesmove")



func crab_move3():
	if CRight == purp:
		$CRight/greencrab.visible = false
		$CRight/yellowcrab.visible = false
		var target_a: float = $CRight.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CRight, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CRight/purplecrab.play("default")
		await $CRight/purplecrab.animation_finished
		var target_b: float = $CRight.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CRight, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CRight.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CRight, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CRight/purplecrab.play("default")
		await $CRight/purplecrab.animation_finished
		var target_d: float = $CRight.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CRight, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave1-1".visible = false
		var target_e: float = $CRight.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CRight, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CRight/purplecrab.play("default")
		await $CRight/purplecrab.animation_finished
		var target_f: float = $CRight.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CRight, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	elif CRight == green:
		$CRight/yellowcrab.visible = false
		$CRight/purplecrab.visible = false
		var target_a: float = $CRight.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CRight, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CRight/greencrab.play("default")
		await $CRight/greencrab.animation_finished
		var target_b: float = $CRight.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CRight, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CRight.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CRight, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CRight/greencrab.play("default")
		await $CRight/greencrab.animation_finished
		var target_d: float = $CRight.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CRight, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave1-1".visible = false
		var target_e: float = $CRight.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CRight, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CRight/greencrab.play("default")
		await $CRight/greencrab.animation_finished
		var target_f: float = $CRight.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CRight, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	elif CRight == yellow:
		$CRight/greencrab.visible = false
		$CRight/purplecrab.visible = false
		var target_a: float = $CRight.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CRight, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CRight/yellowcrab.play("default")
		await $CRight/yellowcrab.animation_finished
		var target_b: float = $CRight.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CRight, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CRight.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CRight, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CRight/yellowcrab.play("default")
		await $CRight/yellowcrab.animation_finished
		var target_d: float = $CRight.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CRight, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave1-1".visible = false
		var target_e: float = $CRight.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CRight, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CRight/yellowcrab.play("default")
		await $CRight/yellowcrab.animation_finished
		var target_f: float = $CRight.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CRight, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
func crab_move2():
		# Left
	if CLeft == purp:
		$CLeft/greencrab.visible = false
		$CLeft/yellowcrab.visible = false
		var target_a: float = $CLeft.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CLeft, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CLeft/purplecrab.play("default")
		await $CLeft/purplecrab.animation_finished
		var target_b: float = $CLeft.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CLeft, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CLeft.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CLeft, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CLeft/purplecrab.play("default")
		await $CLeft/purplecrab.animation_finished
		var target_d: float = $CLeft.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CLeft, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave1-1".visible = false
		var target_e: float = $CLeft.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CLeft, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CLeft/purplecrab.play("default")
		await $CLeft/purplecrab.animation_finished
		var target_f: float = $CLeft.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CLeft, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	elif CLeft == green:
		$CLeft/yellowcrab.visible = false
		$CLeft/purplecrab.visible = false
		var target_a: float = $CLeft.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CLeft, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CLeft/greencrab.play("default")
		await $CLeft/greencrab.animation_finished
		var target_b: float = $CLeft.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CLeft, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CLeft.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CLeft, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CLeft/greencrab.play("default")
		await $CLeft/greencrab.animation_finished
		var target_d: float = $CLeft.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CLeft, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave1-1".visible = false
		var target_e: float = $CLeft.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CLeft, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
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
		$CLeft/yellowcrab.play("default")
		await $CLeft/yellowcrab.animation_finished
		var target_b: float = $CLeft.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CLeft, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CLeft.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CLeft, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CLeft/yellowcrab.play("default")
		await $CLeft/yellowcrab.animation_finished
		var target_d: float = $CLeft.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CLeft, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave1-1".visible = false
		var target_e: float = $CLeft.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CLeft, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CLeft/yellowcrab.play("default")
		await $CLeft/yellowcrab.animation_finished
		var target_f: float = $CLeft.position.y + 100
		var tween6: Tween = create_tween()
		tween6.tween_property($CLeft, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
func crab_move():
	CMid = randi_range(0, 2)
	CLeft = randi_range(0, 2)
	CRight = randi_range(0, 2)
	# Middle
	if CMid == purp:
		$CMid/greencrab.visible = false
		$CMid/yellowcrab.visible = false
		var target_a: float = $CMid.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CMid, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CMid/purplecrab.play("default")
		await $CMid/purplecrab.animation_finished
		var target_b: float = $CMid.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CMid, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CMid.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CMid, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CMid/purplecrab.play("default")
		await $CMid/purplecrab.animation_finished
		var target_d: float = $CMid.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CMid, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave1-1".visible = false
		var target_e: float = $CMid.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CMid, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CMid/purplecrab.play("default")
		await $CMid/purplecrab.animation_finished
		var target_f: float = $CMid.position.y + 50
		var tween6: Tween = create_tween()
		tween6.tween_property($CMid, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	elif CMid == green:
		$CMid/yellowcrab.visible = false
		$CMid/purplecrab.visible = false
		var target_a: float = $CMid.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CMid, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CMid/greencrab.play("default")
		await $CMid/greencrab.animation_finished
		var target_b: float = $CMid.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CMid, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CMid.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CMid, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CMid/greencrab.play("default")
		await $CMid/greencrab.animation_finished
		var target_d: float = $CMid.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CMid, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave1-1".visible = false
		var target_e: float = $CMid.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CMid, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CMid/greencrab.play("default")
		await $CMid/greencrab.animation_finished
		var target_f: float = $CMid.position.y + 50
		var tween6: Tween = create_tween()
		tween6.tween_property($CMid, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	elif CMid == yellow:
		$CMid/greencrab.visible = false
		$CMid/purplecrab.visible = false
		var target_a: float = $CMid.position.y - 85
		var tween: Tween = create_tween()
		tween.tween_property($CMid, "position:y", target_a, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CMid/yellowcrab.play("default")
		await $CMid/yellowcrab.animation_finished
		var target_b: float = $CMid.position.y + 123
		var tween2: Tween = create_tween()
		tween2.tween_property($CMid, "position:y", target_b, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave2-1".visible = false
		var target_c: float = $CMid.position.y - 75
		var tween3: Tween = create_tween()
		tween3.tween_property($CMid, "position:y", target_c, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CMid/yellowcrab.play("default")
		await $CMid/yellowcrab.animation_finished
		var target_d: float = $CMid.position.y + 200
		var tween4: Tween = create_tween()
		tween4.tween_property($CMid, "position:y", target_d, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.4).timeout
		$"Crabwave1-1".visible = false
		var target_e: float = $CMid.position.y - 100
		var tween5: Tween = create_tween()
		tween5.tween_property($CMid, "position:y", target_e, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$CMid/yellowcrab.play("default")
		await $CMid/yellowcrab.animation_finished
		var target_f: float = $CMid.position.y + 50
		var tween6: Tween = create_tween()
		tween6.tween_property($CMid, "position:y", target_f, 0.3).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
