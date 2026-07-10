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
	print($StaticBody2D/CollisionShape2D.position.x)
	print($StaticBody2D/CollisionShape2D2.position.x)
	$fishbub.visible = false
	$Label.visible = false

func _on_button_pressed() -> void:
	$Outside/Slider.position = Vector2(127,6)
	var pos = Vector2(get_global_mouse_position())
	#print(pos)
	if bobber == false:
		fightcount = 0
		fight_style = ""
		bobber = true	
		$bobber.visible = true
		$bobber.position = pos
		var bob_pos: Vector2 = $bobber.global_position
		$fishbub.global_position = bob_pos
		$fishbub2.global_position = bob_pos
		print($fishbub.global_position)
		print(pos)
		rand_time()
		print("cast")
	
	elif bobber == true and fishing == false:
		bobber = false
		fishing = false
		$bobber.visible = false
		$FishingTimer.stop()
		print("realled")
		
	elif bobber == true and fishing == true:
		var target_x: float = $Outside/Slider.position.x + 25
		var tween: Tween = create_tween()
		tween.tween_property($Outside/Slider, "position:x", target_x, 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

func rand_time():
	time = randi_range(2, 7)
	$FishingTimer.wait_time = time
	$FishingTimer.start()

func _on_fishing_timer_timeout() -> void:
	$FishingTimer.stop()
	fishing = true
	if bobber == true and fishing == true:
		fish = randi_range(1, 3)
		print(fish)
		print(fish_ammount)
		if fish == 1:
			$Outside/Slider.modulate = Color(0.031, 0.235, 0.078)
		elif fish == 2:
			$Outside/Slider.modulate = Color(0.303, 0.048, 0.073, 1.0)
		elif fish == 3:
			$Outside/Slider.modulate = Color(0.656, 0.578, 0.158, 1.0)
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
		print("Starting WaitReel for ", time_catch, " seconds")
		fight_type()
		inside_slide()
		
func _physics_process(delta: float) -> void:
	
	
	
	if fishing == true and fight_style == "stream" and fish == 1:
		$Outside/Slider.position.x -= 40 * delta	
	elif fishing == true and fight_style == "stream" and fish == 2:
		$Outside/Slider.position.x -= 60 * delta	
	elif fishing == true and fight_style == "stream" and fish == 3:
		$Outside/Slider.position.x -= 80 * delta	

func slide_move():
	if fish == 1:
		var target_x: float = $Outside/Slider.position.x - 70
		slider_tween = create_tween()
		slider_tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		fight_type()

	elif fish == 2:
		var target_x: float = $Outside/Slider.position.x - 85
		slider_tween = create_tween()
		slider_tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		fight_type()

	elif fish == 3:
		var target_x: float = $Outside/Slider.position.x - 90
		slider_tween = create_tween()
		slider_tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		fight_type()

func fight_type():
	fish_type = randi_range(1,2)
	#print(fish_type)
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
			else:
				fight_style = "fight"
				fightcount += 1
				slide_move()

func _on_wait_reel_timeout() -> void:
	$Button.disabled = true
	fishing = false
	bobber = false
	$fishbub2.visible = false
	$bobber.visible = false
	$fishbub.visible = false
	$Outside.visible = false
	if fish == 1:
		$ColorRect/PurpleFish.visible = false
		$ColorRect/Puff.visible = false
		$ColorRect/GreenFish.visible = true
		$ColorRect/GoldenCatFish.visible = false
		$ColorRect/Label.text = "You Caught A Common Green Stipe!"
		$ColorRect/Label.visible = true
		$AnimationPlayer.play("fish_caught")
		await $AnimationPlayer.animation_finished
		$ColorRect/Label.visible = false
	elif fish == 2:
		$ColorRect/PurpleFish.visible = true
		$ColorRect/Puff.visible = false
		$ColorRect/GreenFish.visible = false
		$ColorRect/GoldenCatFish.visible = false
		$ColorRect/Label.text = "You Caught A Rare Purple Strider!"
		$ColorRect/Label.visible = true
		$AnimationPlayer.play("fish_caught")
		await $AnimationPlayer.animation_finished
		$ColorRect/Label.visible = false
	elif fish == 3:
		$ColorRect/PurpleFish.visible = false
		$ColorRect/Puff.visible = true
		$ColorRect/GreenFish.visible = false
		$ColorRect/GoldenCatFish.visible = false
		$ColorRect/Label.text = "You Caught A Epic Puffer!"
		$ColorRect/Label.visible = true
		$AnimationPlayer.play("fish_caught")
		await $AnimationPlayer.animation_finished
		$ColorRect/Label.visible = false
	elif fish == 4:
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
	if fish_ammount == 4:
		$Button.disabled = true
		print("caught all fish")
	else:
		$Button.disabled = false

func _on_s_lider_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("lineedge"):
		if slider_tween and slider_tween.is_valid():
			slider_tween.kill()
		fishing = false
		bobber = false
		$fishbub2.visible = false
		$bobber.visible = false
		$fishbub.visible = false
		$Outside.visible = false
		fish_type = 3
		$WaitReel.stop()
		fishing = false
		bobber = false
		print("in edge")


func _on_area_2d_3_body_exited(body: Node2D) -> void: 
	$TimeOutOfTank.start()
	#this is the inside one
func _on_area_2d_3_body_entered(body: Node2D) -> void:
	$TimeOutOfTank.stop()
	#inside one

func _on_timer_timeout() -> void:
	$Button.disabled = true
	$TimeOutOfTank.stop()
	await get_tree().create_timer(0.3).timeout
	$Button.disabled = false
	print("fish lost")

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
