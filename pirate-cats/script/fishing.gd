extends Node2D
var bobber = false  #this is if there is no fish on the line but they only cast it (true)
var fishing = false #this is if the fish is caught and usr is not (false) playing mini game
var time
var fish = 1
var fish_ammount = 0
var fight_style
var time_catch
var fightcount = 0

func _ready() -> void:
	$Outside.visible = false
	$fishbub.visible = false

func _on_button_pressed() -> void:
	var pos = Vector2(get_global_mouse_position())
	#print(pos)
	if bobber == false:
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
		var target_x: float = $Outside/Slider.position.x + 15
		var tween: Tween = create_tween()
		tween.tween_property($Outside/Slider, "position:x", target_x, 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

func rand_time():
	time = randi_range(2, 7)
	$FishingTimer.wait_time = time
	$FishingTimer.start()

func _on_fishing_timer_timeout() -> void:
	fishing = true
	if bobber == true and fishing == true:
		fish = randi_range(1, 3)
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
		print('fighting fish')
		fish = randi_range(1,3)
		time_catch = randi_range(8, 15)
		$WaitReel.wait_time = time_catch
		$WaitReel.start()
		fight_type()
		
func _physics_process(delta: float) -> void:
	if fishing == true and fight_style == "stream" and fish == 1:
		$Outside/Slider.position.x -= 15 * delta	
	elif fishing == true and fight_style == "stream" and fish == 2:
		$Outside/Slider.position.x -= 20 * delta	
	elif fishing == true and fight_style == "stream" and fish == 3:
		$Outside/Slider.position.x -= 30 * delta	

func slide_move():
	if fish == 1:
		var target_x: float = $Outside/Slider.position.x - 40
		var tween: Tween = create_tween()
		tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		fight_type()
	elif fish == 2:
		var target_x: float = $Outside/Slider.position.x - 50
		var tween: Tween = create_tween()
		tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		fight_type()
	elif fish == 3:
		var target_x: float = $Outside/Slider.position.x - 60
		var tween: Tween = create_tween()
		tween.tween_property($Outside/Slider, "position:x", target_x, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		fight_type()

func fight_type():
	var fish_type = randi_range(1,2)
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
			else:
				fight_style = "fight"
				fightcount += 1
				slide_move()

func _on_wait_reel_timeout() -> void:
	$Outside.visible = false
	print("STOP")
	fish_ammount += 1
	bobber = false
	fishing = false
	if fish_ammount == 2:
		$Button.disabled = true
		print("caught all fish")
		
