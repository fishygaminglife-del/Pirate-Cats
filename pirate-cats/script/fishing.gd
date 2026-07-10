extends Node2D
var bobber = false  #this is if there is no fish on the line but they only cast it (true)
var fishing = false #this is if the fish is caught and usr is not (false) playing mini game
var time
var fish = 1
var fish_ammount = 0
var fight_style
var time_catch
var fightcount = 0
var fish_type
var slider_tween: Tween
var ins_move
var insslide_move 
var insslider_tween: Tween
var time_insmove
func _ready() -> void:
	$Outside.visible = false
	$fishbub.visible = false
	$Label.visible = false

func _on_button_pressed() -> void:
	var pos = Vector2(get_global_mouse_position())
	if bobber == false:
		$Outside/Slider.position = Vector2(127,6)
		fightcount = 0
		fight_style = ""
		bobber = true	
		$bobber.visible = true
		$bobber.position = pos
		var bob_pos: Vector2 = $bobber.global_position
		$fishbub.global_position = bob_pos
		$fishbub2.global_position = bob_pos
		rand_time()
	
	elif bobber == true and fishing == false:
		bobber = false
		fishing = false
		$bobber.visible = false
		$FishingTimer.stop()
		
	elif bobber == true and fishing == true:
		var target_x: float = $Outside/Slider.position.x + 15
		var tween: Tween = create_tween()
		tween.tween_property($Outside/Slider, "position:x", target_x, 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

func rand_time():
	time = randi_range(1, 4)
	$FishingTimer.wait_time = time
	$FishingTimer.start()

func _on_fishing_timer_timeout() -> void:
	$FishingTimer.stop()
	fishing = true
	if bobber == true and fishing == true:
		if fish_ammount == 4:
			fish = 7
		else:
			fish = randi_range(1, 6)
		if fish == 1 or fish == 2 or fish == 3:
			$Outside/Slider.modulate = Color(0.031, 0.235, 0.078)
		elif fish == 4 or fish == 5:
			$Outside/Slider.modulate = Color(0.304, 0.404, 0.935, 1.0)
		elif fish == 6:
			$Outside/Slider.modulate = Color(0.965, 0.385, 0.342, 1.0)
		elif fish == 7:
			$Outside/Slider.modulate = Color(0.91, 0.588, 0.129, 1.0)
		$fishbub.visible = true
		$Outside.visible = true
		$fishbub2.frame = 0
		$fishbub.frame = 0
		$fishbub.play("default")
		$fishbub2.play("default")
		$fishbub2.visible = true
		time_catch = randi_range(8, 15)
		$WaitReel.wait_time = time_catch
		$WaitReel.start()
		fight_type()
		inside_slide()
		
func _physics_process(delta: float) -> void:
	if fishing == true and fight_style == "stream" and (fish == 1 or fish == 2 or fish == 3):
		$Outside/Slider.position.x -= 60 * delta	
	elif fishing == true and fight_style == "stream" and (fish == 4 or fish == 5):
		$Outside/Slider.position.x -= 50 * delta	
	elif fishing == true and fight_style == "stream" and fish == 6:
		$Outside/Slider.position.x -= 40 * delta	
	elif fishing == true and fight_style == "stream" and fish == 7:
		$Outside/Slider.position.x -= 30 * delta	
	$Outside/Slider.position.x = clamp(
		$Outside/Slider.position.x,
		0,
	$Outside.size.x - $Outside/Slider.size.x
	)
func slide_move():
	if fish == 1 or fish == 2 or fish == 3:
		var target_x: float = clamp(
		$Outside/Slider.position.x - 50,
		0,
	$Outside.size.x - $Outside/Slider.size.x
	)
		slider_tween = create_tween()
		slider_tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await slider_tween.finished
		if fishing:
			fight_type()

	elif fish == 4 or fish == 5:
		var target_x: float = clamp(
		$Outside/Slider.position.x - 60,
		0,
	$Outside.size.x - $Outside/Slider.size.x
	)
		slider_tween = create_tween()
		slider_tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await slider_tween.finished
		if fishing:
			fight_type()

	elif fish == 6:
		var target_x: float = clamp(
		$Outside/Slider.position.x - 70,
		0,
	$Outside.size.x - $Outside/Slider.size.x
	)
		slider_tween = create_tween()
		slider_tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await slider_tween.finished
		if fishing:
			fight_type()
	elif fish == 7:
		var target_x: float = clamp(
		$Outside/Slider.position.x - 75,
		0,
	$Outside.size.x - $Outside/Slider.size.x
	)
		slider_tween = create_tween()
		slider_tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		await slider_tween.finished
		if fishing:
			fight_type()

func fight_type():
	fish_type = randi_range(1,2)
	if fishing == true:
		if fish_type == 1:
			fightcount = 0
			fight_style = "stream"
			var time_fight = randi_range(1,4)
			await get_tree().create_timer(time_fight).timeout
			if !fishing:
				return
			fight_type()
		elif fish_type == 2:
			if fightcount > 1:
				fish_type = 1
				fight_style = "stream"
				var time_fight = randi_range(1,4)
				await get_tree().create_timer(time_fight).timeout
				if !fishing:
					return
				fight_type()
			else:
				fight_style = "fight"
				fightcount += 1
				await slide_move()

func _on_wait_reel_timeout() -> void:
	if slider_tween and slider_tween.is_valid():
		slider_tween.kill()
	$Button.disabled = true
	$TimeOutOfTank.stop()
	$InsMove.stop()
	if insslider_tween:
		insslider_tween.kill()
	fishing = false
	bobber = false
	$fishbub2.visible = false
	$bobber.visible = false
	$fishbub.visible = false
	$Outside.visible = false
	if fish == 1 or fish == 2 or fish == 3:
		$ColorRect/PurpleFish.visible = false
		$ColorRect/Puff.visible = false
		$ColorRect/GreenFish.visible = true
		$ColorRect/GoldenCatFish.visible = false
		$ColorRect/Label.text = "You Caught A Common Green Stipe!"
		$ColorRect/Label.visible = true
		$AnimationPlayer.play("fish_caught")
		await $AnimationPlayer.animation_finished
		$ColorRect/Label.visible = false
	elif fish == 4 or fish == 5:
		$ColorRect/PurpleFish.visible = true
		$ColorRect/Puff.visible = false
		$ColorRect/GreenFish.visible = false
		$ColorRect/GoldenCatFish.visible = false
		$ColorRect/Label.text = "You Caught A Rare Purple Strider!"
		$ColorRect/Label.visible = true
		$AnimationPlayer.play("fish_caught")
		await $AnimationPlayer.animation_finished
		$ColorRect/Label.visible = false
	elif fish == 6:
		$ColorRect/PurpleFish.visible = false
		$ColorRect/Puff.visible = true
		$ColorRect/GreenFish.visible = false
		$ColorRect/GoldenCatFish.visible = false
		$ColorRect/Label.text = "You Caught A Epic Puffer!"
		$ColorRect/Label.visible = true
		$AnimationPlayer.play("fish_caught")
		await $AnimationPlayer.animation_finished
		$ColorRect/Label.visible = false
	elif fish == 7:
		$ColorRect/PurpleFish.visible = false
		$ColorRect/Puff.visible = false
		$ColorRect/GreenFish.visible = false
		$ColorRect/GoldenCatFish.visible = true
		$ColorRect/Label.text = "You Caught A Legendary Fish With A Map!"
		$ColorRect/Label.visible = true
		$AnimationPlayer.play("fish_caught")
		await $AnimationPlayer.animation_finished
		$ColorRect/Label.visible = false
	
	$Outside.visible = false
	print("STOP")
	fish_ammount += 1
	bobber = false
	fishing = false
	await get_tree().create_timer(0.3).timeout
	if fish_ammount == 5:
		print("done")
	else:
		$Button.disabled = false

func _on_s_lider_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("lineedge"):

		$Button.disabled = true
		$TimeOutOfTank.stop()
		if slider_tween and slider_tween.is_valid():
			slider_tween.kill()
		if insslider_tween and insslider_tween.is_valid():
			insslider_tween.kill()
		$InsMove.stop()
		$WaitReel.stop()
		fishing = false
		bobber = false
		print("fish lost")
		await get_tree().create_timer(0.5).timeout
		$Outside.visible = false
		$fishbub.visible = false
		$fishbub2.visible =false
		$bobber.visible = false
		$Button.disabled = false
		fish_type = 3
		$WaitReel.stop()
		
		print("in edge")


func inside_slide():
	if insslider_tween:
		insslider_tween.kill()

	var left_limit = 0
	var right_limit = $Outside.size.x - $Outside/Inside.size.x

	var target = randf_range(left_limit, right_limit)

	insslider_tween = create_tween()
	insslider_tween.tween_property(
		$Outside/Inside,
		"position:x",
		target,
		0.5
	)
	$InsMove.start()

func _on_ins_move_timeout() -> void:
	$InsMove.stop()
	inside_slide()



func _on_inside_slider_area_entered(area: Area2D) -> void:
	print("enter")
	$TimeOutOfTank.stop()


func _on_inside_slider_area_exited(area: Area2D) -> void:
	print("exited")
	$TimeOutOfTank.start()


func _on_time_out_of_tank_timeout() -> void:
	$Button.disabled = true
	$TimeOutOfTank.stop()
	if slider_tween and slider_tween.is_valid():
		slider_tween.kill()
	if insslider_tween and insslider_tween.is_valid():
		insslider_tween.kill()
	$InsMove.stop()
	$WaitReel.stop()
	fishing = false
	bobber = false
	print("fish lost")
	await get_tree().create_timer(0.5).timeout
	$Outside.visible = false
	$fishbub.visible = false
	$fishbub2.visible =false
	$bobber.visible = false
	$Button.disabled = false
